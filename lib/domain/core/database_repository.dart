import 'dart:collection';

import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/deck/deck.dart';

abstract class DatabaseRepository {
  Future<void> addNewDeck(Deck deck);
  Future<void> updateDeck(Deck deck, Deck newData);
  Future<void> deleteDeck(Deck deck);
  Stream<List<Deck>> decks();
  Stream<Queue<MyCard>> cards();
  Future<User> getUser(String uid);
  Future<void> addNewCard(MyCard card);
  Future<void> updateMyDefintion(MyCard updateThisCard, String myDefiniton);
  Future<void> updateCard(MyCard card, MyCard cardData);
  Future<void> deleteCard(MyCard card);
}
