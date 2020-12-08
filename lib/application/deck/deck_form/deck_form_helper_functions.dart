import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:kt_dart/collection.dart';

KtList<CardItem> deckFormHelperFunction(Deck deck) {
  final firstUnstudiedCard =
      deck.cards.getOrCrash().first((card) => card.studied == false);
  final firstUnstudiedCardUpdated = firstUnstudiedCard.copyWith(studied: true);
  final modifiableList = deck.cards.getOrCrash().iter.toList();
  modifiableList.remove(firstUnstudiedCard);
  modifiableList.add(firstUnstudiedCardUpdated);
  final updatedList = modifiableList.toImmutableList();
  return updatedList;
}
