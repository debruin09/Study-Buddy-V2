import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/speech/speech_bloc.dart';

import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/core/theme_styles.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/study/core/draggable_card.dart';
import 'package:study_buddy/presentation/study/misc/providers.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';

class StudyPageBody extends HookWidget {
  final Deck deck;
  final bool withPomodoro;
  const StudyPageBody({
    Key key,
    @required this.deck,
    @required this.withPomodoro,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isShowAnswer = useProvider(showAnswerProvider).state;
    final unstudiedCards = useProvider(unstudiedCardsProvider);
    if (unstudiedCards.isEmpty()) {
      return EmptyDeckDisplay();
    }
    return StudyPageBodyDisplay(
      firstUnstudiedCard: unstudiedCards.first().toDomain(),
      isShowAnswer: isShowAnswer,
      deck: deck,
    );
  }
}

class EmptyDeckDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You finished all your cards", style: TextStyle(fontSize: 20.0)),
          const SizedBox(height: 8.0),
          TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              icon: Icon(Icons.panorama_fish_eye),
              onPressed: () => ExtendedNavigator.root.pushStudiedCardsPage(),
              label: Text("Check out your studied cards"))
        ],
      ),
    );
  }
}

class StudyPageBodyDisplay extends StatelessWidget {
  final CardItem firstUnstudiedCard;
  final bool isShowAnswer;
  final Deck deck;

  const StudyPageBodyDisplay({
    Key key,
    @required this.firstUnstudiedCard,
    @required this.isShowAnswer,
    @required this.deck,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        firstUnstudiedCard.front.getOrCrash(),
                        style: studyTextTheme,
                      ),
                    ],
                  ),
                ),
                if (isShowAnswer) ...[
                  DraggableCard(
                    initialSize: 0.9,
                    text: firstUnstudiedCard.back.getOrCrash(),
                    minSize: 0.5,
                  ),
                  firstUnstudiedCard.me.getOrCrash().isNotEmpty
                      ? BlocBuilder<SpeechBloc, SpeechState>(
                          builder: (context, state) {
                          return state.map(
                            initial: (_) => DraggableCard(
                              initialSize: 0.5,
                              text: _.speechEntity.text,
                            ),
                            isListening: (listening) => DraggableCard(
                              initialSize: 0.5,
                              text: listening.speechEntity.text,
                            ),
                            fromDatabase: (_) => DraggableCard(
                              initialSize: 0.5,
                              text: firstUnstudiedCard.me.getOrCrash(),
                            ),
                          );
                        })
                      : Container(),
                ],
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: TimeIntervalWidget(deck: deck)),
      ],
    );
  }
}
