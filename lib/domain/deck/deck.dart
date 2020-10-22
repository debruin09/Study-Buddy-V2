import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:study_buddy/domain/deck/deck_entity.dart';

// ignore: must_be_immutable
class Deck extends Equatable {
  String deckName;
  String id;
  List<String> tags = [];
  String dateCreated;

  Deck({
    this.deckName,
    this.id,
    this.tags,
    this.dateCreated,
  });

  @override
  List<Object> get props => [
        deckName,
        id,
        tags,
        dateCreated,
      ];

  Map<String, dynamic> toMap() {
    return {
      'deckName': deckName,
      'id': id,
      'tags': tags,
      'dateCreated': dateCreated,
    };
  }

  static String encodeDeck(List<Deck> decks) =>
      jsonEncode(decks.map((deck) => deck.toMap()).toList());

  static List<Deck> decodeDeck(String decks) =>
      (jsonDecode(decks) as List<dynamic>)
          .map((deck) => Deck.fromJson(deck))
          .toList();

  static Deck fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Deck(
      deckName: map['deckName'],
      tags: List<String>.from(map['tags']),
      dateCreated: map["dateCreated"],
    );
  }

  factory Deck.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Deck(
      deckName: json['deckName'],
      id: json["id"],
      tags: List<String>.from(json['tags']),
      dateCreated: json["dateCreated"],
    );
  }

  static Deck fromEntity(DeckEntity entity) {
    return Deck(
      deckName: entity.deckName ?? "",
      id: entity.id ?? "",
      tags: entity.tags ?? "",
      dateCreated: entity.dateCreated,
    );
  }

  DeckEntity toEntity() {
    return DeckEntity(
      deckName: deckName,
      id: id,
      tags: tags,
      dateCreated: dateCreated,
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

  String toString() => "$deckName";
}
