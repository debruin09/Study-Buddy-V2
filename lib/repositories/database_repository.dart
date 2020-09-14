import 'package:study_buddy/models/models.dart';

abstract class DatabaseRepository {
  Future<void> addNewDeck(Deck deck);
  Future<void> updateDeck(Deck deck, Deck newData);
  Future<void> deleteDeck(Deck deck);
  Stream<List<Deck>> decks();
  Stream<List<MyCard>> cards();
  Future<User> getUser(String uid);
  Future<void> addNewCard(MyCard card);
  Future<void> addBatchCards(MyCard card);
  Future<void> updateCard(MyCard card, MyCard cardData);
  Future<void> deleteCard(MyCard card);
}
