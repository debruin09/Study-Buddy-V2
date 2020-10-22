part of 'deck_bloc.dart';

@freezed
abstract class DeckState with _$DeckState {
  const factory DeckState.initial() = DeckInitial;
  const factory DeckState.loading() = DeckLoadInProgress;
  const factory DeckState.success({@required List<Deck> decks}) =
      DeckLoadSuccess;
  const factory DeckState.error({@required String message}) = DeckErrorState;
}
