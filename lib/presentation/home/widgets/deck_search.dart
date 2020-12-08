import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';

import 'package:study_buddy/presentation/home/misc/deck_singleton.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

class DeckSearch extends SearchDelegate<String> {
  // final _sharedPref = locator.get<SharedPref>();
  final _deckSingleton = locator<DeckSingleton>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
            color: primaryColor,
          ))
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
    final suggestionList = _deckSingleton.decks;

    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: suggestionList.size,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showResults(context);
              ExtendedNavigator.root.pushStudyPage(deck: suggestionList[index]);
              ExtendedNavigator.root.pop();
            },
            leading: Icon(Icons.search),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index]
                      .name
                      .getOrCrash()
                      .substring(0, query.length),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: suggestionList[index]
                          .name
                          .getOrCrash()
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
    final suggestionList = _deckSingleton.decks;

    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: suggestionList.size,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showResults(context);
              ExtendedNavigator.root.pushStudyPage(deck: suggestionList[index]);
            },
            leading: Icon(Icons.search),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index]
                      .name
                      .getOrCrash()
                      .substring(0, query.length),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: suggestionList[index]
                          .name
                          .getOrCrash()
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
