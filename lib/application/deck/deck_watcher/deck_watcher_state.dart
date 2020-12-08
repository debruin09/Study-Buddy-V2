part of 'deck_watcher_bloc.dart';

@freezed
abstract class DeckWatcherState with _$DeckWatcherState {
  const factory DeckWatcherState.initial() = _Initial;
  const factory DeckWatcherState.loadInProgress() = _LoadInProgress;
  const factory DeckWatcherState.loadSuccess(KtList<Deck> decks) = _LoadSuccess;
  const factory DeckWatcherState.loadFailure(DeckFailure deckFailure) =
      _LoadFailure;
}
