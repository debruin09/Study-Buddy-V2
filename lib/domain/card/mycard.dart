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
  bool isLocal = false;

  MyCard({
    this.front,
    this.back,
    this.me,
    this.id,
    this.difficulty,
    this.tags,
    this.isLocal,
    this.dateCreated,
  });
  @override
  List<Object> get props => [front, back, me, difficulty, dateCreated, tags];

  @override
  String toString() {
    return 'MyCard(front: $front, back: $back, me: $me, id: $id, difficulty: $difficulty, tags: $tags)';
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
        dateCreated: entity.dateCreated);
  }
}
