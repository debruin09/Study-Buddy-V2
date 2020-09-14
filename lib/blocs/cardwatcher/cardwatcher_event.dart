part of 'cardwatcher_bloc.dart';

abstract class CardWatcherEvent extends Equatable {
  const CardWatcherEvent();

  @override
  List<Object> get props => [];
}

class CardNameChanged extends CardWatcherEvent {
  final String cardName;
  CardNameChanged({
    this.cardName,
  });
}

class CardFrontChanged extends CardWatcherEvent {
  final String cardFront;
  CardFrontChanged({
    this.cardFront,
  });
}

class CardBackChanged extends CardWatcherEvent {
  final String cardBack;
  CardBackChanged({
    this.cardBack,
  });
}

class CardTagsChanged extends CardWatcherEvent {
  final List<String> cardTags;

  CardTagsChanged({this.cardTags});
}

class CardSubmitted extends CardWatcherEvent {
  final String cardName;
  final String cardBack;
  final String cardFront;
  final List<String> cardTags;

  CardSubmitted({this.cardName, this.cardBack, this.cardFront, this.cardTags});
}

class CardSubmitToDeck extends CardWatcherEvent {
  final String cardName;
  final String cardBack;
  final String cardFront;
  final List<String> cardTags;

  CardSubmitToDeck(
      {this.cardName, this.cardBack, this.cardFront, this.cardTags});
}
