import 'dart:async';

import 'package:riverpod/all.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/core/database_repository.dart';
import 'package:study_buddy/infrastructure/core/database_service.dart';

final deckRepoProvider =
    Provider<DatabaseRepository>((ref) => FirestoreService());

final deckStreamProvider = StreamProvider.autoDispose<List<Deck>>((ref) async* {
  ref.watch(deckRepoProvider).decks().listen((decks) {
    return decks;
  });
});

class DeckList extends StateNotifier<List<Deck>> {
  DeckList(List<Deck> state) : super(state ?? []);
  DatabaseRepository databaseRepository;

  Future<void> add(Deck deck) async {
    databaseRepository.addNewDeck(deck);
  }

  Future<void> update(Deck updatedDeck, Deck newData) async {
    databaseRepository.updateDeck(updatedDeck, newData);
  }

  Future<void> delete(Deck deck) async {
    databaseRepository.deleteDeck(deck);
  }
}
