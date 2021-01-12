import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:sembast/sembast.dart';
import 'package:study_buddy/domain/deck/deck_failure.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:study_buddy/domain/deck/i_deck_repository.dart';
import 'package:study_buddy/infrastructure/deck/app_database.dart';
import 'package:study_buddy/infrastructure/deck/deck_dao.dart';
import 'package:study_buddy/infrastructure/deck/deck_dtos.dart';
import 'package:study_buddy/infrastructure/core/firestore_helpers.dart';

@LazySingleton(as: IDeckRepository)
class DeckRepository implements IDeckRepository {
  final FirebaseFirestore _firestore;
  final _store = StoreRef.main();

  Future<Database> get _db async => await AppDatabase.instance.database;

  DeckRepository(this._firestore);

  @override
  Future<Either<DeckFailure, Unit>> create(Deck deck) async {
    try {
      final userDoc = await _firestore.userDocument();
      final deckDto = DeckDto.fromDomain(deck);
      final deckDao = DeckDao.fromDomain(deck);
      await userDoc.deckCollection.doc(deckDto.id).set(deckDto.toJson());

      await _store.record(deckDao.id).put(await _db, deckDao.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const DeckFailure.insufficientPermission());
      } else {
        return left(const DeckFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<DeckFailure, KtList<Deck>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.deckCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<DeckFailure, KtList<Deck>>(
            snapshot.docs
                .map((doc) => DeckDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const DeckFailure.insufficientPermission());
      } else {
        print("LOG: <STREAM DECKS FROM FIREBASE>: " + e.toString());
        return left(const DeckFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<DeckFailure, KtList<Deck>>> watchUnstudied() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.deckCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => DeckDto.fromFirestore(doc).toDomain()),
        )
        .map(
          (decks) => right<DeckFailure, KtList<Deck>>(
            decks
                .where((deck) => deck.cards
                    .getOrCrash()
                    .any((cardItem) => !cardItem.studied))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const DeckFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const DeckFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<DeckFailure, Unit>> delete(Deck deck) async {
    try {
      final userDoc = await _firestore.userDocument();
      final deckId = deck.id.getOrCrash();

      await userDoc.deckCollection.doc(deckId).delete();

      final finder = Finder(filter: Filter.byKey(deckId));
      await _store.delete(await _db, finder: finder);

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const DeckFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const DeckFailure.unableToUpdate());
      } else {
        return left(const DeckFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<DeckFailure, Unit>> update(Deck deck) async {
    try {
      final userDoc = await _firestore.userDocument();
      final deckDto = DeckDto.fromDomain(deck);
      final deckDao = DeckDao.fromDomain(deck);

      await userDoc.deckCollection.doc(deckDto.id).update(deckDto.toJson());

      final finder = Finder(filter: Filter.byKey(deckDao.id));
      await _store.update(await _db, deckDao.toJson(), finder: finder);

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const DeckFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const DeckFailure.unableToUpdate());
      } else {
        return left(const DeckFailure.unexpected());
      }
    } catch (e) {
      print("Unexpected error: $e and ${e.runtimeType}");
      return left(const DeckFailure.unexpected());
    }
  }

  @override
  Future<Either<DeckFailure, KtList<Deck>>> getAllDecks() async {
    try {
      final ktDecks = (await _store.find(await _db))
          .map((snapshot) => DeckDao.fromJson(snapshot.value).toDomain())
          .toImmutableList();

      return right(ktDecks);
    } on FirebaseException catch (e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const DeckFailure.insufficientPermission());
      } else {
        print("LOG: RETRIEVING DECKS FROM SEMBAT: " + e.toString());
        return left(const DeckFailure.unexpected());
      }
    }
  }
}
