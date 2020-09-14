import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/entities/entities.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/repositories/database_repository.dart';
import 'package:study_buddy/services/helper_service.dart';

class FirestoreService implements DatabaseRepository {
  static final globalId = locator.get<GlobalId>();
  static final db = FirebaseFirestore.instance;
  static final userCollection = db.collection("users");

  var cardBatch = db.batch();

  String uid;
  FirestoreService({this.uid});

  Future updateUserData(
      {String uid, String username, String email, String password}) async {
    return await userCollection.doc(uid).set({
      "uid": uid,
      "password": password,
      "username": username,
      "email": email,
    });
  }

  @override
  Future<void> addNewDeck(Deck deck) async {
    print("This is the current deck id: ${globalId.deckId}");
    return userCollection
        .doc(globalId.userId)
        .collection("decks")
        .doc(globalId.deckId)
        .set(deck.toEntity().toDocument());
  }

  /// Deltes the [Deck] specified
  @override
  Future<void> deleteDeck(Deck deck) {
    return userCollection
        .doc(globalId.userId)
        .collection("decks")
        .doc(deck.id)
        .delete();
  }

  /// Updates the [Deck] specified
  @override
  Future<void> updateDeck(Deck update, Deck newData) {
    return userCollection
        .doc(globalId.userId)
        .collection("decks")
        .doc(update.id)
        .update(newData.toEntity().toDocument());
  }

  /// Listen to a stream of decks
  @override
  Stream<List<Deck>> decks() {
    try {
      return userCollection
          .doc(globalId.userId)
          .collection("decks")
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => Deck.fromEntity(
                  DeckEntity.fromSnapshot(doc),
                ))
            .toList();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Fetches the user with this uid from the database
  @override
  Future<User> getUser(String uid) async {
    try {
      final userData = await userCollection.doc(uid).get();
      return User.fromMap(userData.data());
    } catch (e) {
      print("Error from getUser: ${e.toString()}");
      return null;
    }
  }

  /// Adds a new [MyCard] to an existing [Deck]
  @override
  Future<void> addNewCard(MyCard card) async {
    return userCollection
        .doc(globalId.userId)
        .collection("decks")
        .doc(globalId.deckId)
        .collection("cards")
        .doc(card.id)
        .set(card.toEntity().toDocument());
  }

  /// Add Batch of [MyCard]
  @override
  Future<void> addBatchCards(MyCard card) async {
    return cardBatch.set(
        userCollection
            .doc(globalId.userId)
            .collection("decks")
            .doc(globalId.deckId)
            .collection("cards")
            .doc(globalId.cardId),
        card.toEntity().toDocument());
  }

  @override
  Future<void> deleteCard(MyCard card) {
    return userCollection
        .doc(globalId.userId)
        .collection("decks")
        .doc(globalId.deckId)
        .collection("cards")
        .doc(card.id)
        .delete();
  }

  @override
  Future<void> updateCard(MyCard updateThisCard, MyCard updatedCard) {
    return userCollection
        .doc(globalId.userId)
        .collection("decks")
        .doc(globalId.deckId)
        .collection("cards")
        .doc(updateThisCard.id)
        .update(updatedCard.toEntity().toDocument());
  }

  /// Listen to a stream of cards
  @override
  Stream<List<MyCard>> cards() {
    try {
      return userCollection
          .doc(globalId.userId)
          .collection("decks")
          .doc(globalId.deckId)
          .collection("cards")
          .orderBy("dateCreated", descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => MyCard.fromEntity(
                  CardEntity.fromSnapshot(doc),
                ))
            .toList();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
