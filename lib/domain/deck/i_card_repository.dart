import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/deck/deck.dart';

import 'deck_failure.dart';

abstract class ICardRepository {
  Future<Either<DeckFailure, Unit>> create(Deck deck);
  Future<Either<DeckFailure, Unit>> update(Deck deck);
  Future<Either<DeckFailure, Unit>> delete(Deck deck);
  Future<Either<DeckFailure, KtList<Deck>>> getAllCards();
}
