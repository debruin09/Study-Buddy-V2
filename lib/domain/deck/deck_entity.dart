import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
// ignore: must_be_immutable
class DeckEntity extends Equatable {
  final String deckName;
  final String id;
  List<String> tags = [];
  String dateCreated;

  DeckEntity({
    this.deckName,
    this.id,
    this.tags,
    this.dateCreated,
  });

  @override
  List<Object> get props => [deckName, id, tags, dateCreated];

  static DeckEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DeckEntity(
      deckName: map['deckName'],
      id: map['id'],
      tags: List<String>.from(map['tags']),
      dateCreated: map['dateCreated'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'deckName': deckName,
      'tags': tags,
      'dateCreated': dateCreated,
    };
  }

  static DeckEntity fromSnapshot(DocumentSnapshot snap) {
    return DeckEntity(
      deckName: snap.data()['deckName'] ?? "",
      id: snap.data()["id"] ?? "",
      tags: List<String>.from(snap.data()['tags'] ?? []),
      dateCreated: snap.data()['dateCreated'],
    );
  }
}
