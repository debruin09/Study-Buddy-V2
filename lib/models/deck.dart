import 'package:equatable/equatable.dart';

import 'package:study_buddy/entities/deck_entity.dart';

// ignore: must_be_immutable
class Deck extends Equatable {
  String deckName;
  String id;
  List<String> tags = [];

  Deck({
    this.deckName,
    this.id,
    this.tags,
  });

  @override
  List<Object> get props => [
        deckName,
        id,
        tags,
      ];

  Map<String, dynamic> toMap() {
    return {
      'deckName': deckName,
      'id': id,
      'tags': tags,
    };
  }

  static Deck fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Deck(
      deckName: map['deckName'],
      tags: List<String>.from(map['tags']),
    );
  }

  static Deck fromEntity(DeckEntity entity) {
    return Deck(
      deckName: entity.deckName ?? "",
      id: entity.id ?? "",
      tags: entity.tags ?? "",
    );
  }

  DeckEntity toEntity() {
    return DeckEntity(
      deckName: deckName,
      id: id,
      tags: tags,
    );
  }

  Deck copyWith({
    String deckName,
    String id,
    List<String> tags,
  }) {
    return Deck(
      deckName: deckName ?? this.deckName,
      id: id ?? this.id,
      tags: tags ?? this.tags,
    );
  }
}
