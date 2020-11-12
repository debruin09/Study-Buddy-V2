import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/core/failures/errors.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';

extension ListX<T> on List<MyCard> {
  /// Cast's a List to a Queue
  Queue<MyCard> toQueue() {
    final Queue<MyCard> queue = Queue<MyCard>.from(this);
    return queue;
  }
}

extension CardCollectionX<T> on CollectionReference {
  /// Card collection reference extension
  Future<CollectionReference> cardCollection() async {
    final userOption = await locator.get<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    final deck = locator.get<GlobalId>();
    final collection = this
        .doc(user.uid)
        .collection("decks")
        .doc(deck.deckId)
        .collection("cards");

    return collection;
  }

  /// Deck collection reference extension
  Future<CollectionReference> deckCollection() async {
    final userOption = await locator.get<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    final collection = this.doc(user.uid).collection("decks");
    return collection;
  }
}
