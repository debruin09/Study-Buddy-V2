import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:study_buddy/entities/entities.dart';
// import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/repositories/database_repository.dart';
import 'package:study_buddy/utils/validators.dart';

part 'cardwatcher_event.dart';
part 'cardwatcher_state.dart';

class CardWatcherBloc extends Bloc<CardWatcherEvent, CardWatcherState> {
  final DatabaseRepository databaseRepository;

  CardWatcherBloc({this.databaseRepository})
      : assert(databaseRepository != null),
        super(CardWatcherState.initial());

  @override
  Stream<CardWatcherState> mapEventToState(
    CardWatcherEvent event,
  ) async* {
    if (event is CardNameChanged) {
      yield* _mapCardNameChangedToState(event.cardName);
    } else if (event is CardFrontChanged) {
      yield* _mapCardFrontChangedToState(event.cardFront);
    } else if (event is CardBackChanged) {
      yield* _mapCardBackChangedToState(event.cardBack);
    } else if (event is CardTagsChanged) {
      yield* _mapCardTagsChangedToState(event.cardTags);
    } else if (event is CardSubmitted) {
      yield* _mapCardSubmittedToState();
    } else if (event is CardSubmitToDeck) {
      yield* _mapCardSubmitToDeckToState();
    }
  }

// TODO: UPDATE VALIDATORS
  Stream<CardWatcherState> _mapCardNameChangedToState(String cardName) async* {
    yield state.update(isCardNameValid: Validators.isValidUsername(cardName));
  }

  Stream<CardWatcherState> _mapCardFrontChangedToState(
      String cardFront) async* {
    yield state.update(isFrontValid: Validators.isValidUsername(cardFront));
  }

  Stream<CardWatcherState> _mapCardBackChangedToState(String cardBack) async* {
    yield state.update(isBackValid: Validators.isValidUsername(cardBack));
  }

  Stream<CardWatcherState> _mapCardTagsChangedToState(
      List<String> cardTags) async* {
    yield state.update(isCardTagsValid: Validators.isValidUsername("cardName"));
  }

  Stream<CardWatcherState> _mapCardSubmittedToState(
      // {
      // String cardName,
      // String cardBack,
      // String cardFront,
      // List<String> cardTag,
      // }
      ) async* {
    try {} catch (e) {}
  }

  Stream<CardWatcherState> _mapCardSubmitToDeckToState(
      //   {
      //   String cardName,
      //   String cardBack,
      //   String cardFront,
      //   List<String> cardTag,
      // }
      ) async* {
    try {} catch (e) {}
  }
}
