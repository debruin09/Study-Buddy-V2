import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/domain/card/mycard.dart';
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
  CollectionReference cardCollection() {
    final globalId = locator.get<GlobalId>();
    final collection = this
        .doc(globalId.userId)
        .collection("decks")
        .doc(globalId.deckId)
        .collection("cards");

    return collection;
  }

  /// Deck collection reference extension
  CollectionReference deckCollection() {
    final globalId = locator.get<GlobalId>();
    final collection = this.doc(globalId.userId).collection("decks");
    return collection;
  }
}
