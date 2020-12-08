import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:study_buddy/domain/core/failures.dart';
import 'package:study_buddy/domain/core/value_objects.dart';
import 'package:study_buddy/domain/core/value_validators.dart';

class DeckName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory DeckName(String input) {
    assert(input != null);
    return DeckName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const DeckName._(this.value);
}

class CardFront extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 800;

  factory CardFront(String input) {
    assert(input != null);
    return CardFront._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const CardFront._(this.value);
}

class CardBack extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 800;

  factory CardBack(String input) {
    assert(input != null);
    return CardBack._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const CardBack._(this.value);
}

class HardCard extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory HardCard(int counter) {
    assert(counter != null);
    return HardCard._(validateInteger(counter));
  }

  const HardCard._(this.value);
}

class ModerateCard extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ModerateCard(int counter) {
    assert(counter != null);
    return ModerateCard._(validateInteger(counter));
  }

  const ModerateCard._(this.value);
}

class EasyCard extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory EasyCard(int counter) {
    assert(counter != null);
    return EasyCard._(validateInteger(counter));
  }

  const EasyCard._(this.value);
}

class CardMe extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 800;

  factory CardMe(String input) {
    assert(input != null);
    return CardMe._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const CardMe._(this.value);
}

class List6<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 6;

  factory List6(KtList<T> input) {
    assert(input != null);
    return List6._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List6._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
