part of 'deck_watcher_bloc.dart';

@freezed
abstract class DeckWatcherEvent with _$DeckWatcherEvent {
  const factory DeckWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory DeckWatcherEvent.watchUnstudiedStarted() =
      _WatchUnstudiedStarted;
  const factory DeckWatcherEvent.decksReceived(
    Either<DeckFailure, KtList<Deck>> failureOrDecks,
  ) = _DecksReceived;
}
