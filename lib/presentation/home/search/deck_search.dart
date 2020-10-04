import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
// import 'package:study_buddy/utils/get_instance.dart';

class DeckSearch extends SearchDelegate<String> {
  final deckScope = locator.get<DecksScope>();
  final globalId = locator.get<GlobalId>();
  // final _sharedPref = locator.get<SharedPref>();
  final List<Deck> decks = [
    Deck(deckName: "Deck 1"),
    Deck(deckName: "Deck 2"),
    Deck(deckName: "Deck 3"),
    Deck(deckName: "Deck 4")
  ];
  final List<Deck> recentDecks = [
    Deck(deckName: "Deck 2"),
    Deck(deckName: "Deck 3"),
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            actionsIconTheme: IconThemeData(color: Colors.black)));
    return super.appBarTheme(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentDecks
        : deckScope.decks
            .where((deck) => deck.deckName.contains(query))
            .toList();
    // _sharedPref.save("suggestions", suggestionList);
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showResults(context);
              globalId.setDeckId(suggestionList[index].id);
              ExtendedNavigator.root.push(
                Routes.deckStudyPage,
                arguments: DeckStudyPageArguments(deck: suggestionList[index]),
              );
              ExtendedNavigator.root.pop();
            },
            leading: Icon(Icons.search),
            title: RichText(
              text: TextSpan(
                  text:
                      suggestionList[index].deckName.substring(0, query.length),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: suggestionList[index]
                          .deckName
                          .substring(query.length),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )
                  ]),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentDecks
        : deckScope.decks
            .where((deck) => deck.deckName.contains(query))
            .toList();
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showResults(context);
              globalId.setDeckId(suggestionList[index].id);
              ExtendedNavigator.root.push(
                Routes.deckStudyPage,
                arguments: DeckStudyPageArguments(deck: suggestionList[index]),
              );
            },
            leading: Icon(Icons.search),
            title: RichText(
              text: TextSpan(
                  text:
                      suggestionList[index].deckName.substring(0, query.length),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: suggestionList[index]
                          .deckName
                          .substring(query.length),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )
                  ]),
            ),
          );
        });
  }
}
