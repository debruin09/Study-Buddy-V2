import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/core/database_repository.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';

part 'deck_event.dart';
part 'deck_state.dart';
part 'deck_bloc.freezed.dart';

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  DeckBloc(this.databaseRepository) : super(DeckInitial());
  final deckScope = locator.get<DecksScope>();

  // Dependancy
  final DatabaseRepository databaseRepository;
  StreamSubscription _decksSubscription;
  @override
  Stream<DeckState> mapEventToState(DeckEvent event) async* {
    yield* event.map(
        load: (_) => _mapLoadDecksToState(),
        delete: (e) => _mapDeleteDeckToState(e),
        update: (e) => _mapUpdateDeckToState(e),
        add: (e) => _mapAddDeckToState(e),
        updated: (e) => _mapDecksUpdateToState(e));
  }

  Stream<DeckState> _mapDecksUpdateToState(DeckUpdated event) async* {
    try {
      yield DeckState.success(decks: event.decks);
    } catch (e) {
      yield DeckState.error(message: e.toString());
    }
  }

  /// [CRUD OPERATIONS]
  Stream<DeckState> _mapLoadDecksToState() async* {
    _decksSubscription?.cancel();
    _decksSubscription = databaseRepository.decks().listen(
      (decks) {
        deckScope.setDecks(decks);
        add(DeckEvent.updated(decks: decks));
      },
    );
  }

  Stream<DeckState> _mapAddDeckToState(AddDeck event) async* {
    databaseRepository.addNewDeck(event.deck);
  }

  Stream<DeckState> _mapUpdateDeckToState(UpdateDeck event) async* {
    databaseRepository.updateDeck(event.updatedDeck);
  }

  Stream<DeckState> _mapDeleteDeckToState(DeleteDeck event) async* {
    databaseRepository.deleteDeck(event.deck);
  }

  Future<void> dispose() async {
    _decksSubscription?.cancel();
  }
}
