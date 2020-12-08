part of 'deck_actor_bloc.dart';

@freezed
abstract class DeckActorEvent with _$DeckActorEvent {
  const factory DeckActorEvent.deleted(Deck deck) = _Deleted;
}
