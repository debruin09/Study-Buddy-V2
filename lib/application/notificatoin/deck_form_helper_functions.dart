import 'package:flutter/material.dart';
import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

KtList<CardItem> markCardAsStudied(KtList<CardItemPrimitive> cardPrimitive) {
  final firstUnstudiedCard =
      cardPrimitive.firstOrNull((card) => card.studied == true);
  final updatedCard =
      firstUnstudiedCard.copyWith(studied: false, color: Colors.white.value);

  final filteredList =
      cardPrimitive.filter((cardItem) => cardItem != firstUnstudiedCard);
  final newfilteredList = filteredList.plusElement(updatedCard);

  print("<NOTIFICATION BLOC> This is the updated list: $newfilteredList");
  return newfilteredList.map((primitive) => primitive.toDomain());
}
