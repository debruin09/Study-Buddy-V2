part of 'deck_bloc.dart';

@freezed
abstract class DeckEvent with _$DeckEvent {
  const factory DeckEvent.load() = LoadDecks;
  const factory DeckEvent.delete({@required Deck deck}) = DeleteDeck;
  const factory DeckEvent.update(
      {@required Deck updatedDeck}) = UpdateDeck;
  const factory DeckEvent.add({@required Deck deck}) = AddDeck;
  const factory DeckEvent.updated({@required List<Deck> decks}) = DeckUpdated;
}
