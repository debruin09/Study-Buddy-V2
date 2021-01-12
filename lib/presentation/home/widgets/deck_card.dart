// Deck Widget
// Deck Widget
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:study_buddy/application/deck/deck_actor/deck_actor_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeckCard extends ConsumerWidget {
  final Deck deck;

  final GlobalKey<ScaffoldState> gKey;

  DeckCard({@required this.deck, @required this.gKey});
  Widget build(BuildContext context, ScopedReader watch) {
    final formProvider = watch(formCardsProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        elevation: 1.0,
        clipBehavior: Clip.antiAlias,
        color: cardColor,
        child: InkWell(
          splashColor: primaryColor.withOpacity(0.5),
          onTap: () async {
            ExtendedNavigator.root.pushDeckFormPage(deck: deck);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            leading: Container(
              color: Colors.blue[800],
              height: double.infinity,
              width: 5.0,
            ),
            title: Text(
              "${deck.name.getOrCrash()}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              formProvider.value = deck.cards
                  .getOrCrash()
                  .map((_) => CardItemPrimitive.fromDomain(_));

              ExtendedNavigator.root
                  .pushStudyPage(deck: deck, withPomodoro: false);
            },
            onLongPress: () {
              final deckActorBloc = ReadContext(context).read<DeckActorBloc>();

              deleteDialogue(gKey, context, deckActorBloc);
            },
            subtitle: difficultyCount(deck),
            trailing: IconButton(
              onPressed: () {
                formProvider.value = deck.cards
                    .getOrCrash()
                    .map((_) => CardItemPrimitive.fromDomain(_));

                ExtendedNavigator.root.push(
                  Routes.deckFormPage,
                  arguments: DeckFormPageArguments(deck: deck),
                );
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.blue[800],
                size: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteDialogue(GlobalKey<ScaffoldState> state, context,
      DeckActorBloc deckActorBloc) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure you want to delete: "),
            content: Text(deck.name.getOrCrash()),
            actions: [
              FlatButton(
                onPressed: () {
                  deckActorBloc.add(DeckActorEvent.deleted(deck));
                  ExtendedNavigator.root.pop();
                  state.currentState.showSnackBar(SnackBar(
                      content: Text("${deck.name.getOrCrash()} deleted")));
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FlatButton(
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
                child: Text(
                  "cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }
}

Widget difficultyCount(Deck deck) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Text(
      "${deck.hardCard.getOrCrash()}",
      style: TextStyle(color: Colors.red, fontSize: 20.0),
    ),
    const SizedBox(width: 5.0),
    Text(
      "${deck.moderateCard.getOrCrash()}",
      style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
    ),
    const SizedBox(width: 5.0),
    Text(
      "${deck.easyCard.getOrCrash()}",
      style: TextStyle(color: Colors.green, fontSize: 20.0),
    ),
  ]);
}
