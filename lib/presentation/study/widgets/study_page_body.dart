import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:study_buddy/presentation/home/widgets/critical_failure_display.dart';
import 'package:study_buddy/presentation/home/widgets/error_deck_card.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';
import 'package:study_buddy/presentation/study/core/draggable_card.dart';
import 'package:study_buddy/presentation/core/theme_styles.dart';

class StudyPageBody extends HookWidget {
  final Deck deck;
  const StudyPageBody({Key key, @required this.deck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isShowAnswer = useProvider(showAnswerProvider).state;

    return BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => Loader(color: primaryColor),
          loadSuccess: (state) {
            if (state.decks.isEmpty()) {
              // This case is when there is no cards left to study
              return _cardsStudiedDisplay();
            } else {
              final currentStateDeck =
                  state.decks.firstOrNull((stateDeck) => stateDeck == deck);

              if (currentStateDeck == null) {
                // This case is when our tapped on deck is already studied
                // The tapped on deck does not match any of the unstudied decks
                return _cardsStudiedDisplay();
              }

              final onlyUnstudiedCards = currentStateDeck.cards
                  .getOrCrash()
                  .filter((card) => !card.studied);

              final firstUnstudiedCard = onlyUnstudiedCards.first();
              return _buildColumn(context, firstUnstudiedCard, isShowAnswer);
            }
          },
          loadFailure: (state) =>
              CriticalFailureDisplay(failure: state.deckFailure),
        );
      },
    );
  }
}

Widget _cardsStudiedDisplay() {
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

Widget _buildColumn(context, CardItem firstUnstudiedCard, bool isShowAnswer) {
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
                      style: studyTextTheme.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    firstUnstudiedCard.studied ? Text("studied") : Container(),
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
                    ? DraggableCard(
                        initialSize: 0.5,
                        text: firstUnstudiedCard.me.getOrCrash(),
                      )
                    : Container(),
              ],
            ],
          ),
        ),
      ),
      const Expanded(flex: 1, child: TimeIntervalWidget()),
    ],
  );
}
