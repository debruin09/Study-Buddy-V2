import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/deck_failure.dart';

abstract class IDeckRepository {
  Future<Either<DeckFailure, Unit>> create(Deck deck);
  Future<Either<DeckFailure, Unit>> update(Deck deck);
  Future<Either<DeckFailure, Unit>> delete(Deck deck);
  Stream<Either<DeckFailure, KtList<Deck>>> watchAll();
  Stream<Either<DeckFailure, KtList<Deck>>> watchUnstudied();
  Future<Either<DeckFailure, KtList<Deck>>> getAllDecks();
}
