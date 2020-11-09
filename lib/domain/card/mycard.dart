import 'package:equatable/equatable.dart';
import 'package:study_buddy/domain/card/card_entity.dart';

// ignore: must_be_immutable
class MyCard extends Equatable {
  String front;
  String back;
  String me;
  String id;
  String difficulty;
  String dateCreated;
  List<String> tags;
  List<String> imagesUrl;

  MyCard({
    this.front,
    this.back,
    this.me,
    this.id,
    this.difficulty,
    this.tags,
    this.dateCreated,
    this.imagesUrl,
  });
  @override
  List<Object> get props =>
      [front, back, me, difficulty, dateCreated, tags, imagesUrl];

  @override
  String toString() {
    return 'MyCard(front: $front)';
  }

  Map<String, dynamic> toMap() {
    return {
      'front': front,
      'back': back,
      'me': me,
      'id': id,
      'dateCreated': dateCreated,
      'difficulty': difficulty,
      'tags': tags,
      'imagesUrl': imagesUrl,
    };
  }

  static MyCard fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MyCard(
      front: map['front'],
      back: map['back'],
      me: map['me'],
      id: map['id'],
      difficulty: map['difficulty'],
      dateCreated: map['dateCreated'],
      tags: List<String>.from(map['tags']),
      imagesUrl: List<String>.from(map['imagesUrl']),
    );
  }

  CardEntity toEntity() {
    return CardEntity(
      back: back,
      difficulty: difficulty,
      id: id,
      front: front,
      me: me,
      tags: tags,
      dateCreated: dateCreated,
      imagesUrl: imagesUrl,
    );
  }

  static MyCard fromEntity(CardEntity entity) {
    return MyCard(
      back: entity.back,
      difficulty: entity.difficulty,
      id: entity.id,
      front: entity.front,
      me: entity.me,
      tags: entity.tags,
      dateCreated: entity.dateCreated,
      imagesUrl: entity.imagesUrl,
    );
  }

  MyCard copyWith({
    String front,
    String back,
    String me,
    String id,
    String difficulty,
    String dateCreated,
    List<String> tags,
    List<String> imagesUrl,
  }) {
    return MyCard(
      front: front ?? this.front,
      back: back ?? this.back,
      me: me ?? this.me,
      id: id ?? this.id,
      difficulty: difficulty ?? this.difficulty,
      dateCreated: dateCreated ?? this.dateCreated,
      tags: tags ?? this.tags,
      imagesUrl: imagesUrl ?? this.imagesUrl,
    );
  }
}
