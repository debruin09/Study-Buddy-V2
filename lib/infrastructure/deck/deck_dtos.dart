import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/core/value_objects.dart';
import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:kt_dart/collection.dart';
import 'dart:ui';

part 'deck_dtos.freezed.dart';
part 'deck_dtos.g.dart';

@freezed
abstract class DeckDto implements _$DeckDto {
  const DeckDto._();

  const factory DeckDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required int easyCard,
    @required int moderateCard,
    @required int hardCard,
    @required List<CardItemDto> cards,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _DeckDto;

  factory DeckDto.fromDomain(Deck deck) {
    final cards = deck.cards
        .getOrCrash()
        .map(
          (cardItem) => CardItemDto.fromDomain(cardItem),
        )
        .asList();

    return DeckDto(
      id: deck.id.getOrCrash(),
      name: deck.name.getOrCrash(),
      cards: cards,
      easyCard: deck.easyCard.getOrCrash(),
      moderateCard: deck.moderateCard.getOrCrash(),
      hardCard: deck.hardCard.getOrCrash(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Deck toDomain() {
    return Deck(
      id: UniqueId.fromUniqueString(id),
      name: DeckName(name),
      easyCard: EasyCard(easyCard),
      hardCard: HardCard(hardCard),
      moderateCard: ModerateCard(moderateCard),
      cards: List6(cards.map((cto) => cto.toDomain()).toImmutableList()),
    );
  }

  factory DeckDto.fromJson(Map<String, dynamic> json) =>
      _$DeckDtoFromJson(json);

  factory DeckDto.fromFirestore(DocumentSnapshot doc) {
    return DeckDto.fromJson(doc.data()).copyWith(id: doc.id);
  }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

@freezed
abstract class CardItemDto implements _$CardItemDto {
  const CardItemDto._();

  const factory CardItemDto({
    @required String id,
    @required String front,
    @required String back,
    @required String me,
    @required bool studied,
    @required int color,
  }) = _CardItemDto;

  factory CardItemDto.fromDomain(CardItem cardItem) {
    return CardItemDto(
      id: cardItem.id.getOrCrash(),
      front: cardItem.front.getOrCrash(),
      back: cardItem.back.getOrCrash(),
      me: cardItem.me.getOrCrash(),
      studied: cardItem.studied,
      color: cardItem.color.value,
    );
  }

  CardItem toDomain() {
    return CardItem(
      id: UniqueId.fromUniqueString(id),
      front: CardFront(front),
      back: CardBack(back),
      me: CardMe(me),
      studied: studied,
      color: Color(color),
    );
  }

  factory CardItemDto.fromJson(Map<String, dynamic> json) =>
      _$CardItemDtoFromJson(json);
}

// instance.cards?.map((card) => card?.toJson())?.toList(),
