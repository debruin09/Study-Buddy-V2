import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/misc/deck_singleton.dart';
import 'package:study_buddy/presentation/home/widgets/critical_failure_display.dart';
import 'package:study_buddy/presentation/home/widgets/deck_card.dart';
import 'package:study_buddy/presentation/home/widgets/error_deck_card.dart';

class HomePageBody extends HookWidget {
  final GlobalKey<ScaffoldState> gKey;
  const HomePageBody({
    Key key,
    @required this.gKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deckSingleton = locator<DeckSingleton>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => Loader(color: primaryColor),
              loadSuccess: (state) {
                if (state.decks.isEmpty()) {
                  return Center(
                    child: Text(
                      "No deck's found. Start studying!!",
                      style: TextStyle(color: Colors.black38, fontSize: 20.0),
                    ),
                  );
                }
                _deckSingleton.decks = state.decks;

                return ListView.builder(
                  itemCount: state.decks.size,
                  itemBuilder: (context, index) {
                    final deck = state.decks[index];
                    if (deck.failureOption.isSome()) {
                      return ErrorDeckCard(deck: deck);
                    } else {
                      return DeckCard(gKey: gKey, deck: deck);
                    }
                  },
                );
              },
              loadFailure: (state) =>
                  CriticalFailureDisplay(failure: state.deckFailure));
        },
      ),
    );
  }
}
