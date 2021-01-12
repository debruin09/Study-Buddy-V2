import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

KtList<CardItemPrimitive> markCardAsStudied(
    {@required FormCards formProvider,
    @required KtList<CardItemPrimitive> unstudiedCards,
    @required Color color}) {
  final cardToBeUpdated =
      formProvider.value.firstOrNull((prim) => prim == unstudiedCards.first());
  final updatedCard =
      cardToBeUpdated.copyWith(studied: true, color: color.value);
  final modifiableList = formProvider.value.iter.toList();
  modifiableList.remove(cardToBeUpdated);
  modifiableList.add(updatedCard);

  return modifiableList.toImmutableList();
}

KtList<CardItemPrimitive> updateCardWithMyDefinition(
    {@required FormCards formProvider,
    @required KtList<CardItemPrimitive> unstudiedCards,
    @required String recordedText}) {
  final cardToBeUpdated =
      formProvider.value.firstOrNull((prim) => prim == unstudiedCards.first());
  final updatedCard = cardToBeUpdated.copyWith(me: recordedText);
  final modifiableList = formProvider.value.iter.toList();
  modifiableList.remove(cardToBeUpdated);
  modifiableList.add(updatedCard);

  return modifiableList.toImmutableList();
}
