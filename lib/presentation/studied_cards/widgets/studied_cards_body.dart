import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/deck/deck.dart';

class StudiedCardsBody extends StatelessWidget {
  final KtList<Deck> decks;
  const StudiedCardsBody({Key key, @required this.decks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: decks.size,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: StudiedCardTile(
            deck: decks[index],
          ),
        );
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
    return ListView.builder(
        shrinkWrap: true,
        itemCount: cards.size,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Material(
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(cards[index].front.getOrCrash()),
                    subtitle: Text(deck.name.getOrCrash()),
                  ),
                  Container(
                      color: cards[index].color,
                      width: double.infinity,
                      height: 5.0),
                ],
              ),
            ),
          );
        });
  }
}
