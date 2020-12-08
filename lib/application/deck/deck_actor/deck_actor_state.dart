part of 'deck_actor_bloc.dart';

@freezed
abstract class DeckActorState with _$DeckActorState {
  const factory DeckActorState.initial() = _Initial;
  const factory DeckActorState.actionInProgress() = _ActionInProgress;
  const factory DeckActorState.deleteFailure(DeckFailure deckFailure) =
      _DeleteFailure;
  const factory DeckActorState.deleteSuccess() = _DeleteSuccess;
}
