import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/core/value_objects.dart';
import 'package:study_buddy/domain/deck/card_item.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';

part 'card_item_presentation_classes.freezed.dart';

final formCardsProvider =
    ChangeNotifierProvider.autoDispose((ref) => FormCards());

class FormCards extends ValueNotifier<KtList<CardItemPrimitive>> {
  FormCards() : super(emptyList<CardItemPrimitive>());
}

@freezed
abstract class CardItemPrimitive implements _$CardItemPrimitive {
  const CardItemPrimitive._();

  const factory CardItemPrimitive({
    @required UniqueId id,
    @required String front,
    @required String back,
    @required String me,
    @required bool studied,
  }) = _CardItemPrimitive;

  factory CardItemPrimitive.empty() => CardItemPrimitive(
        id: UniqueId(),
        front: '',
        back: '',
        me: '',
        studied: false,
      );

  factory CardItemPrimitive.fromDomain(CardItem cardItem) {
    return CardItemPrimitive(
      id: cardItem.id,
      front: cardItem.front.getOrCrash(),
      back: cardItem.back.getOrCrash(),
      me: cardItem.me.getOrCrash(),
      studied: cardItem.studied,
    );
  }

  CardItem toDomain() {
    return CardItem(
      id: id,
      front: CardFront(front),
      back: CardBack(back),
      me: CardMe(me),
      studied: studied,
    );
  }
}
