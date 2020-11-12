part of 'status_cubit.dart';

@freezed
abstract class DeckStatusState with _$DeckStatusState {
  const factory DeckStatusState.newDeck() = NewDeckState;
  const factory DeckStatusState.editDeck() = EditDeckState;
}

@freezed
abstract class CardStatusState with _$CardStatusState {
  const factory CardStatusState.newCard() = NewCardState;
  const factory CardStatusState.editCard() = EditCardState;
}
