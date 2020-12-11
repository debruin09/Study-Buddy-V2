import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/core/failures.dart';
import 'package:study_buddy/domain/core/value_objects.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:flutter/material.dart';

part 'card_item.freezed.dart';

@freezed
abstract class CardItem implements _$CardItem {
  const CardItem._();

  const factory CardItem({
    @required UniqueId id,
    @required CardFront front,
    @required CardBack back,
    @required CardMe me,
    @required bool studied,
    @required Color color,
  }) = _CardItem;

  factory CardItem.empty() => CardItem(
        id: UniqueId(),
        front: CardFront(''),
        back: CardBack(''),
        me: CardMe(''),
        studied: false,
        color: Color(Colors.white.value),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return front.value.fold((f) => some(f), (_) => none());
  }
}
