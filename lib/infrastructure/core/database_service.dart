import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/domain/card/card_entity.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/deck_entity.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/core/database_repository.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/infrastructure/core/firebase_helpers.dart';

class FirestoreService implements DatabaseRepository {
  static final globalId = locator.get<GlobalId>();
  static final db = FirebaseFirestore.instance;
  static final userCollection = db.collection("users");

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
    final deckCollection = await userCollection.deckCollection();
    return deckCollection
        .doc(globalId.deckId)
        .set(deck.toEntity().toDocument());
  }

  /// Deletes the [Deck] specified
  @override
  Future<void> deleteDeck(Deck deck) async {
    final deckCollection = await userCollection.deckCollection();
    deckCollection.doc(deck.id).collection("cards").deckCollection();
    return deckCollection.doc(deck.id).delete();
  }

  /// Updates the [Deck] specified
  @override
  Future<void> updateDeck(Deck update) async {
    final deckCollection = await userCollection.deckCollection();
    return deckCollection.doc(update.id).update(update.toEntity().toDocument());
  }

  /// Listen to a stream of decks
  @override
  Stream<List<Deck>> decks() async* {
    try {
      final deckCollection = await userCollection.deckCollection();
      yield* deckCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => Deck.fromEntity(
                  DeckEntity.fromSnapshot(doc),
                ))
            .toList();
      });
    } catch (e) {
      print(e.toString());
      yield* null;
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
    final cardCollection = await userCollection.cardCollection();
    return cardCollection.doc(card.id).set(card.toEntity().toDocument());
  }

  @override
  Future<void> deleteCard(MyCard card) async {
    final cardCollection = await userCollection.cardCollection();
    return cardCollection.doc(card.id).delete();
  }

  @override
  Future<void> updateCard(MyCard updateThisCard) async {
    final cardCollection = await userCollection.cardCollection();
    return cardCollection
        .doc(updateThisCard.id)
        .set(updateThisCard.toEntity().toDocument(), SetOptions(merge: true));
  }

  @override
  Future<void> updateMyDefintion(
      MyCard updateThisCard, String myDefiniton) async {
    final cardCollection = await userCollection.cardCollection();
    return cardCollection.doc(updateThisCard.id).set({
      "me": myDefiniton,
    }, SetOptions(merge: true));
  }

  /// Listen to a stream of cards
  @override
  Stream<Queue<MyCard>> cards() async* {
    try {
      final cardCollection = await userCollection.cardCollection();

      yield* cardCollection
          .orderBy("dateCreated", descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => MyCard.fromEntity(
                    CardEntity.fromSnapshot(doc),
                  ))
              .toList()
              .toQueue());
    } catch (e) {
      print(e.toString());
      yield* null;
    }
  }
}
