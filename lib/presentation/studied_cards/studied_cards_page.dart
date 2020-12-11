import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/studied_cards/widgets/filter_dropdown.dart';
import 'package:study_buddy/presentation/studied_cards/widgets/studied_cards_body.dart';

class StudiedCardsPage extends HookWidget {
  const StudiedCardsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredName = useProvider(filterProvider);
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
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text("Studied Cards"),
          actions: [
            IconButton(
              tooltip: "Advanced filters",
              onPressed: () {},
              icon: Icon(Icons.filter_list),
            )
          ],
        ),
        body: BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
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

                final filteredDecks = filteredName.state == "All"
                    ? state.decks
                    : state.decks.filter(
                        (deck) => deck.name.getOrCrash() == filteredName.state);

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 60.0,
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 10.0),
                        margin: const EdgeInsets.all(10.0),
                        child: FilterDropdown(
                          decks: state.decks,
                        ),
                      ),
                      StudiedCardsBody(
                        decks: filteredDecks,
                      ),
                    ],
                  ),
                );
              },
              loadFailure: (state) =>
                  Center(child: Text("${state.deckFailure}")));
        }),
      ),
    );
  }
}
