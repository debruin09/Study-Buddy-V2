import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/home_page.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';
import 'package:study_buddy/presentation/study/core/draggable_card.dart';
import 'package:study_buddy/presentation/core/theme_styles.dart';

class StudyDeck extends HookWidget {
  final Deck deck;
  const StudyDeck({Key key, @required this.deck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isShowAnswer = useProvider(showAnswerProvider).state;

    return BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
        builder: (context, state) {
      return state.map(
        loadFailure: (state) => Center(child: Text("${state.deckFailure}")),
        initial: (_) => Container(),
        loadInProgress: (_) => Loader(color: primaryColor),
        loadSuccess: (state) {
          // print(
          //     "Some test ${state.decks.first((deckList) => deckList == deck)}");
          final unstudiedCards = (state.decks.isNotEmpty())
              ? state.decks
                  .filter((deckList) => deckList == deck)
                  .getOrElse(0, (_) => Deck.empty())
                  .cards
                  .getOrCrash()
                  .filter((card) => card.studied == false)
              : deck.cards.getOrCrash().filter((card) => card.studied == false);

          final firstCard =
              unstudiedCards.getOrElse(0, (_) => CardItem.empty());

          if (state.decks.isNotEmpty()) {
            if (state.decks
                .filter((deckList) => deckList == deck)
                .getOrElse(0, (_) => Deck.empty())
                .failureOption
                .isSome()) {
              return ErronousDeck(
                errorText: deck.failureOption.fold(
                  () => null,
                  (f) => f.maybeMap(
                    empty: (e) => "Sorry, this deck was corrupt ",
                    orElse: () => "Sorry, this deck was corrupt ",
                  ),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                              firstCard.front.getOrCrash(),
                              style: studyTextTheme.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            firstCard.studied ? Text("studied") : Container(),
                          ],
                        ),
                      ),
                      if (isShowAnswer) ...[
                        DraggableCard(
                          initialSize: 0.9,
                          text: firstCard.back.getOrCrash(),
                          minSize: 0.5,
                        ),
                        firstCard.me.getOrCrash().isNotEmpty
                            ? DraggableCard(
                                initialSize: 0.5,
                                text: firstCard.me.getOrCrash(),
                              )
                            : Container(),
                      ],
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: TimeIntervalWidget()),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Deck is empty", style: TextStyle(fontSize: 20.0)),
                  const SizedBox(height: 8.0),
                  TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      icon: Icon(Icons.panorama_fish_eye),
                      onPressed: () =>
                          ExtendedNavigator.root.pushStudiedCardsPage(),
                      label: Text("Check out your studied cards"))
                ],
              ),
            );
          }
        },
      );
    });
  }
}
