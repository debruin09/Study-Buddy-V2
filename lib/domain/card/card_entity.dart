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
  List<String> imagesUrl;
  CardEntity({
    this.front,
    this.back,
    this.id,
    this.me,
    this.difficulty,
    this.tags,
    this.dateCreated,
    this.imagesUrl,
  });

  @override
  List<Object> get props =>
      [front, back, id, me, difficulty, dateCreated, tags, imagesUrl];

  CardEntity copyWith({
    String front,
    String back,
    String id,
    String me,
    String difficulty,
    List<String> tags,
    List<String> imagesUrl,
  }) {
    return CardEntity(
      front: front ?? this.front,
      back: back ?? this.back,
      id: id ?? this.id,
      me: me ?? this.me,
      difficulty: difficulty ?? this.difficulty,
      tags: tags ?? this.tags,
      imagesUrl: imagesUrl ?? this.imagesUrl,
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
      'dateCreated': dateCreated,
      'imagesUrl': imagesUrl,
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
      'dateCreated': dateCreated,
      'imagesUrl': imagesUrl,
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
      dateCreated: snap.data()['dateCreated'],
      imagesUrl: List<String>.from(snap?.data()['imagesUrl']) ?? [],
    );
  }

  static CardEntity fromMap(Map<String, dynamic> map) {
    return CardEntity(
        front: map['front'] ?? "",
        back: map['back'] ?? "",
        id: map['id'] ?? "",
        me: map['me'] ?? "",
        difficulty: map['difficulty'] ?? "",
        tags: List<String>.from(map['tags']) ?? [],
        imagesUrl: List<String>.from(map['imagesUrl']) ?? [],
        dateCreated: map['dateCreated']);
  }

  // @override
  // String toString() {
  //   return 'CardEntity(front: $front, back: $back, id: $id, me: $me, difficulty: $difficulty, tags: $tags)';
  // }
}
