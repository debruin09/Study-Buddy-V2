import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/core/database_repository.dart';

part 'card_event.dart';
part 'card_state.dart';

@injectable
class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc(this.databaseRepository) : super(CardInitial());
// Dependancy
  final DatabaseRepository databaseRepository;
  StreamSubscription _cardsSubscription;
  @override
  Stream<CardState> mapEventToState(CardEvent event) async* {
    if (event is LoadCards) {
      yield* _mapLoadCardsToState();
    } else if (event is CardUpdated) {
      yield* _mapCardsUpdateToState(event);
    } else if (event is AddCard) {
      yield* _mapAddCardToState(event);
    } else if (event is UpdateCard) {
      yield* _mapUpdateCardToState(event);
    } else if (event is DeleteCard) {
      yield* _mapDeleteCardToState(event);
    }
  }

  Stream<CardState> _mapCardsUpdateToState(CardUpdated event) async* {
    try {
      yield CardLoadSuccess(cards: event.cards);
    } catch (e) {
      yield CardErrorState(message: e.toString());
    }
  }

  /// [CRUD OPERATIONS]
  Stream<CardState> _mapLoadCardsToState() async* {
    _cardsSubscription?.cancel();
    _cardsSubscription = databaseRepository.cards().listen(
      (cards) {
        add(CardUpdated(cards));
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
