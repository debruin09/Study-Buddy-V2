part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class LoadCards extends CardEvent {
  @override
  List<Object> get props => [];
}

class DeleteCard extends CardEvent {
  final MyCard card;

  DeleteCard(this.card);
  @override
  List<Object> get props => [card];
}

class UpdateCard extends CardEvent {
  final MyCard updatedCard;
  final MyCard newData;

  UpdateCard(this.updatedCard, this.newData);
  @override
  List<Object> get props => [updatedCard, newData];
}

class AddCard extends CardEvent {
  final MyCard card;

  AddCard(this.card);
  @override
  List<Object> get props => [card];
}

class AddBatchCards extends CardEvent {
  final MyCard card;

  AddBatchCards(this.card);
  @override
  List<Object> get props => [card];
}

class CardUpdated extends CardEvent {
  final List<MyCard> cards;

  CardUpdated(this.cards);
  @override
  List<Object> get props => [cards];
}

class LocalCardAdded extends CardEvent {
  final List<MyCard> cards;

  LocalCardAdded(this.cards);
  @override
  List<Object> get props => [cards];
}
