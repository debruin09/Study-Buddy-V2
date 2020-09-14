part of 'deck_bloc.dart';

abstract class DeckEvent extends Equatable {
  const DeckEvent();
}

class LoadDecks extends DeckEvent {
  @override
  List<Object> get props => [];
}

class DeleteDeck extends DeckEvent {
  final Deck deck;

  DeleteDeck(this.deck);
  @override
  List<Object> get props => [deck];
}

class UpdateDeck extends DeckEvent {
  final Deck updatedDeck;
  final Deck newData;

  UpdateDeck(this.updatedDeck, this.newData);
  @override
  List<Object> get props => [updatedDeck, newData];
}

class AddDeck extends DeckEvent {
  final Deck deck;

  AddDeck(this.deck);
  @override
  List<Object> get props => [deck];
}

class DeckUpdated extends DeckEvent {
  final List<Deck> decks;

  DeckUpdated(this.decks);
  @override
  List<Object> get props => [decks];
}
