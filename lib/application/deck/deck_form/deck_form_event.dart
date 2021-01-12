part of 'deck_form_bloc.dart';

@freezed
abstract class DeckFormEvent with _$DeckFormEvent {
  const factory DeckFormEvent.initialized(Option<Deck> initialDeckOption) =
      _Initialized;
  const factory DeckFormEvent.nameChanged(String nameStr) = _NameChanged;
  const factory DeckFormEvent.cardsChanged(KtList<CardItemPrimitive> cards) =
      _CardsChanged;
  const factory DeckFormEvent.easyCardChange() = _EasyCardChange;
  const factory DeckFormEvent.moderateCardChange() = _ModerateCardChange;
  const factory DeckFormEvent.hardCardChange() = _HardCardChange;

  const factory DeckFormEvent.saved() = _Saved;
}
