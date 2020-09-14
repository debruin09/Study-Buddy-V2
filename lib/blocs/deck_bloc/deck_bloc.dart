import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:study_buddy/models/deck.dart';
import 'package:study_buddy/repositories/database_repository.dart';

part 'deck_event.dart';
part 'deck_state.dart';

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  DeckBloc(this.databaseRepository) : super(DeckInitial());

  // Dependancy
  final DatabaseRepository databaseRepository;
  StreamSubscription _decksSubscription;
  @override
  Stream<DeckState> mapEventToState(DeckEvent event) async* {
    if (event is LoadDecks) {
      yield* _mapLoadDecksToState();
    } else if (event is DeckUpdated) {
      yield* _mapDecksUpdateToState(event);
    } else if (event is AddDeck) {
      yield* _mapAddDeckToState(event);
    } else if (event is UpdateDeck) {
      yield* _mapUpdateDeckToState(event);
    } else if (event is DeleteDeck) {
      yield* _mapDeleteDeckToState(event);
    }
  }

  Stream<DeckState> _mapDecksUpdateToState(DeckUpdated event) async* {
    try {
      yield DeckLoadSuccess(decks: event.decks);
    } catch (e) {
      yield DeckErrorState(message: e.toString());
    }
  }

  /// [CRUD OPERATIONS]
  Stream<DeckState> _mapLoadDecksToState() async* {
    _decksSubscription?.cancel();
    _decksSubscription = databaseRepository.decks().listen(
      (decks) {
        add(DeckUpdated(decks));
      },
    );
  }

  Stream<DeckState> _mapAddDeckToState(AddDeck event) async* {
    databaseRepository.addNewDeck(event.deck);
  }

  Stream<DeckState> _mapUpdateDeckToState(UpdateDeck event) async* {
    databaseRepository.updateDeck(event.updatedDeck, event.newData);
  }

  Stream<DeckState> _mapDeleteDeckToState(DeleteDeck event) async* {
    databaseRepository.deleteDeck(event.deck);
  }

  Future<void> dispose() async {
    _decksSubscription?.cancel();
  }
}
