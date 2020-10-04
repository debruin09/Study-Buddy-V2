import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
// ignore: must_be_immutable
class CardEntity extends Equatable {
  String front;
  String back;
  String id;
  String me;
  String difficulty;
  String dateCreated;
  List<String> tags;
  CardEntity(
      {this.front,
      this.back,
      this.id,
      this.me,
      this.difficulty,
      this.tags,
      this.dateCreated});

  @override
  List<Object> get props =>
      [front, back, id, me, difficulty, dateCreated, tags];

  CardEntity copyWith({
    String front,
    String back,
    String id,
    String me,
    String difficulty,
    List<String> tags,
  }) {
    return CardEntity(
      front: front ?? this.front,
      back: back ?? this.back,
      id: id ?? this.id,
      me: me ?? this.me,
      difficulty: difficulty ?? this.difficulty,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front': front,
      'back': back,
      'id': id,
      'me': me,
      'difficulty': difficulty,
      'tags': tags,
      'dateCreated': dateCreated
    };
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'front': front,
      'back': back,
      'me': me,
      'difficulty': difficulty,
      'tags': tags,
      'dateCreated': dateCreated
    };
  }

  static CardEntity fromSnapshot(DocumentSnapshot snap) {
    return CardEntity(
        front: snap.data()['front'],
        back: snap.data()['back'],
        id: snap.id,
        me: snap.data()['me'],
        difficulty: snap?.data()['difficulty'],
        tags: List<String>.from(snap?.data()['tags']),
        dateCreated: snap.data()['dateCreated']);
  }

  static CardEntity fromMap(Map<String, dynamic> map) {
    return CardEntity(
        front: map['front'] ?? "",
        back: map['back'] ?? "",
        id: map['id'] ?? "",
        me: map['me'] ?? "",
        difficulty: map['difficulty'] ?? "",
        tags: List<String>.from(map['tags']) ?? [],
        dateCreated: map['dateCreated']);
  }

  // @override
  // String toString() {
  //   return 'CardEntity(front: $front, back: $back, id: $id, me: $me, difficulty: $difficulty, tags: $tags)';
  // }
}
