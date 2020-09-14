// Deck Widget
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/services/helper_service.dart';
import 'package:study_buddy/ui/routes/router.gr.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatelessWidget {
  final Deck deck;
  final globalId = locator.get<GlobalId>();

  CustomCard({
    @required this.deck,
  });
  @override
  Widget build(BuildContext context) {
    final deckStatusBloc = context.bloc<DeckStatusCubit>();
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Material(
        color: cardColor,
        child: InkWell(
          onTap: () async {
            globalId.setDeckId(deck.id);

            ExtendedNavigator.rootNavigator.pushNamed(
              Routes.deckStudyPage,
              arguments: DeckStudyPageArguments(deck: deck),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 140.0,
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Top Section of card
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Text(
                              "${deck.deckName ?? ""}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  globalId.setDeckId(deck.id);
                                  deckStatusBloc.changeDeckStatus("edit");
                                  print(
                                      'changed status to ${deckStatusBloc.state}');
                                  ExtendedNavigator.rootNavigator.pushNamed(
                                    Routes.createNewDeckPage,
                                    arguments:
                                        CreateNewDeckPageArguments(deck: deck),
                                  );
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.white.withOpacity(0.6)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text("recent: Most recent card",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                // Tag Section
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: deck.tags
                          .map(
                            (tag) => Expanded(
                              child: Chip(
                                backgroundColor: tagsColor,
                                label: Text('$tag'),
                                labelStyle: TextStyle(
                                  color: appBarColor,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                          .toList()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
