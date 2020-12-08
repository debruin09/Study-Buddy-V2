import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';

class StudiedCardsPage extends StatelessWidget {
  const StudiedCardsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<DeckWatcherBloc>()
            ..add(
              const DeckWatcherEvent.watchAllStarted(),
            ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Studied Cards"),
        ),
        body: StudiedCardsBody(),
      ),
    );
  }
}

class StudiedCardsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => Loader(color: primaryColor),
            loadSuccess: (state) {
              if (state.decks.isEmpty()) {
                return Center(
                  child: Text(
                    "No deck's found.",
                    style: TextStyle(color: Colors.black38, fontSize: 20.0),
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.decks.size,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: StudiedCardTile(
                      deck: state.decks[index],
                    ),
                  );
                },
              );
            },
            loadFailure: (state) =>
                Center(child: Text("${state.deckFailure}")));
      },
    );
  }
}

class StudiedCardTile extends HookWidget {
  final Deck deck;

  const StudiedCardTile({Key key, @required this.deck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cards =
        deck.cards.getOrCrash().filter((card) => card.studied == true);
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, state) => Divider(),
        itemCount: cards.size,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cards[index].front.getOrCrash()),
            subtitle: Text(deck.name.getOrCrash()),
          );
        });
    // : Center(
    //     child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child:
    //         Text("No cards studied yet", style: TextStyle(fontSize: 15.0)),
    //   ));
  }
}
