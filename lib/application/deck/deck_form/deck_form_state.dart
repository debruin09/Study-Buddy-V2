part of 'deck_form_bloc.dart';

@freezed
abstract class DeckFormState with _$DeckFormState {
  const factory DeckFormState({
    @required Deck deck,
    @required bool showErrorMessages,
    @required bool isEditing,
    @required bool isSaving,
    @required Option<Either<DeckFailure, Unit>> saveFailureOrSuccessOption,
  }) = _DeckFormState;

  factory DeckFormState.initial() => DeckFormState(
        deck: Deck.empty(),
        showErrorMessages: false,
        isEditing: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
