// Deck Widget
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/theme/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatelessWidget {
  final Deck deck;
  final globalId = locator.get<GlobalId>();

  CustomCard({
    @required this.deck,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: cardColor,
      child: InkWell(
        onTap: () async {
          globalId.setDeckId(deck.id);
          ExtendedNavigator.root.push(
            Routes.deckStudyPage,
            arguments: DeckStudyPageArguments(deck: deck),
          );
        },
        child: Container(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: Column(children: [
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    "${deck.deckName}",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      globalId.setDeckId(deck.id);
                      context.bloc<DeckStatusCubit>().editDeck();
                      ExtendedNavigator.root.push(
                        Routes.createNewDeckPage,
                        arguments: CreateNewDeckPageArguments(deck: deck),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: deck.tags == null
                    ? [Container()]
                    : deck.tags
                        .map(
                          (tag) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: Chip(
                              backgroundColor: tagsColor,
                              label: Text('$tag'),
                              labelStyle: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
