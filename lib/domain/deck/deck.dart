import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:study_buddy/domain/core/failures.dart';
import 'package:study_buddy/domain/core/value_objects.dart';
import 'package:study_buddy/domain/deck/card_item.dart';

import 'package:study_buddy/domain/deck/value_objects.dart';

part 'deck.freezed.dart';

@freezed
abstract class Deck implements _$Deck {
  const Deck._();

  const factory Deck({
    @required UniqueId id,
    @required DeckName name,
    @required HardCard hardCard,
    @required ModerateCard moderateCard,
    @required EasyCard easyCard,
    @required List6<CardItem> cards,
  }) = _Deck;

  factory Deck.empty() => Deck(
        id: UniqueId(),
        name: DeckName(''),
        cards: List6(emptyList()),
        hardCard: HardCard(0),
        moderateCard: ModerateCard(0),
        easyCard: EasyCard(0),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(cards.failureOrUnit)
        .andThen(
          cards
              .getOrCrash()
              // Getting the failureOption from the CardItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
              .map((cardItem) => cardItem.failureOption)
              .filter((o) => o.isSome())
              // If we can't get the 0th element, the list is empty. In such a case, it's valid.
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold((f) => some(f), (_) => none());
  }
}
