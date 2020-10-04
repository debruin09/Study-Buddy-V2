part of 'deck_bloc.dart';

abstract class DeckState extends Equatable {
  const DeckState();
}

class DeckInitial extends DeckState {
  @override
  List<Object> get props => [];
}

class DeckLoadInProgress extends DeckState {
  @override
  List<Object> get props => [];
}

class DeckLoadSuccess extends DeckState {
  final List<Deck> decks;

  DeckLoadSuccess({@required this.decks}) : assert(decks != null);
  @override
  List<Object> get props => [decks];

  @override
  String toString() => 'DeckLoadSuccess(decks: $decks)';
}

class DeckErrorState extends DeckState {
  final String message;

  DeckErrorState({@required this.message}) : assert(message != null);
  @override
  List<Object> get props => [message];
}
