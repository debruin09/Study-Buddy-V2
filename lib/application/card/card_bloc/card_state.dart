part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardInitial extends CardState {}

class CardLoadInProgress extends CardState {
  @override
  List<Object> get props => [];
}

class CardLoadSuccess extends CardState {
  final List<MyCard> cards;

  CardLoadSuccess({@required this.cards}) : assert(cards != null);
  @override
  List<Object> get props => [cards];

  @override
  String toString() => 'CardLoadSuccess(Cards: $cards)';
}

class LocalCardLoadSucces extends CardState {
  final List<MyCard> cards;

  LocalCardLoadSucces({@required this.cards}) : assert(cards != null);
  @override
  List<Object> get props => [cards];

  @override
  String toString() => 'LocalCardLoadSucces(Cards: $cards)';
}

class CardErrorState extends CardState {
  final String message;

  CardErrorState({@required this.message}) : assert(message != null);
  @override
  List<Object> get props => [message];
}
