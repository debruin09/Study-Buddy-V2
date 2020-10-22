// Deck Widget
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/domain/core/utils/custom_extensions.dart';

class DeckCard extends StatelessWidget {
  final Deck deck;
  final globalId = locator.get<GlobalId>();

  DeckCard({
    @required this.deck,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(20.0),
      color: cardColor,
      child: InkWell(
        onTap: () async {
          globalId.setDeckId(deck.id);
          ExtendedNavigator.root.push(
            Routes.deckStudyPage,
            arguments: DeckStudyPageArguments(deck: deck),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset("assets/images/card-bg.png"),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 30.0, top: 10.0, bottom: 10.0, right: 10.0),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${deck.deckName}",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
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
                                arguments:
                                    CreateNewDeckPageArguments(deck: deck),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: primaryColor,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(DateTime.parse(deck.dateCreated).formatDate()),
                    const SizedBox(
                      height: 15.0,
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
                                        color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
