import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/core/database_repository.dart';
import 'package:study_buddy/domain/core/scheduler/queue_scheduler.dart';
import 'package:study_buddy/injection.dart';
part 'card_event.dart';
part 'card_state.dart';
part 'card_bloc.freezed.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc(this.databaseRepository) : super(CardState.initial());
// Dependancy
  final DatabaseRepository databaseRepository;
  StreamSubscription _cardsSubscription;
  final queueScheduler = locator.get<QueueScheduler>();

  @override
  Stream<CardState> mapEventToState(CardEvent event) async* {
    yield* event.map(
        load: (_) => _mapLoadCardsToState(),
        delete: (e) => _mapDeleteCardToState(e),
        update: (e) => _mapUpdateCardToState(e),
        add: (e) => _mapAddCardToState(e),
        updated: (e) => _mapCardsUpdateToState(e));
  }

  Stream<CardState> _mapCardsUpdateToState(CardUpdated event) async* {
    yield CardState.loading();
    try {
      queueScheduler.clear();
      queueScheduler.populate(event.cards);

      yield CardState.success(cards: event.cards);
    } catch (e) {
      yield CardState.error(message: e.toString());
    }
  }

  /// [CRUD OPERATIONS]
  Stream<CardState> _mapLoadCardsToState() async* {
    _cardsSubscription?.cancel();
    _cardsSubscription = databaseRepository.cards().listen(
      (cards) {
        add(CardEvent.updated(cards: cards));
      },
    );
  }

  Stream<CardState> _mapAddCardToState(AddCard event) async* {
    databaseRepository.addNewCard(event.card);
  }

  Stream<CardState> _mapUpdateCardToState(UpdateCard event) async* {
    databaseRepository.updateCard(event.updatedCard, event.newData);
  }

  Stream<CardState> _mapDeleteCardToState(DeleteCard event) async* {
    databaseRepository.deleteCard(event.card);
  }

  Future<void> dispose() async {
    _cardsSubscription?.cancel();
  }
}
