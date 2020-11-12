part of 'field_watcher_bloc.dart';

@freezed
abstract class FieldWatcherEvent with _$FieldWatcherEvent {
  const factory FieldWatcherEvent.deckNameChange() = _DeckNameChange;
  const factory FieldWatcherEvent.tagChange() = _TagChange;
}
