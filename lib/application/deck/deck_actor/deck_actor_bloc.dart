import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/deck_failure.dart';
import 'package:study_buddy/domain/deck/i_deck_repository.dart';

part 'deck_actor_event.dart';
part 'deck_actor_state.dart';
part 'deck_actor_bloc.freezed.dart';

@injectable
class DeckActorBloc extends Bloc<DeckActorEvent, DeckActorState> {
  final IDeckRepository _deckRepository;

  DeckActorBloc(this._deckRepository) : super(const DeckActorState.initial());

  @override
  Stream<DeckActorState> mapEventToState(
    DeckActorEvent event,
  ) async* {
    yield const DeckActorState.actionInProgress();
    final possibleFailure = await _deckRepository.delete(event.deck);
    yield possibleFailure.fold(
      (f) => DeckActorState.deleteFailure(f),
      (_) => const DeckActorState.deleteSuccess(),
    );
  }
}
