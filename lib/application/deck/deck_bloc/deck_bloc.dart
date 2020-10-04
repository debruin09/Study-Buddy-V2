import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/core/database_repository.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';

part 'deck_event.dart';
part 'deck_state.dart';

@injectable
class DeckBloc extends Bloc<DeckEvent, DeckState> {
  DeckBloc(this.databaseRepository) : super(DeckInitial());
  final deckScope = locator.get<DecksScope>();

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
        deckScope.setDecks(decks);
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
