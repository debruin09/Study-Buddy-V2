part of 'card_bloc.dart';

@freezed
abstract class CardEvent with _$CardEvent {
  const factory CardEvent.load() = LoadCards;
  const factory CardEvent.delete({@required MyCard card}) = DeleteCard;
  const factory CardEvent.update({@required MyCard updatedCard}) = UpdateCard;
  const factory CardEvent.add({@required MyCard card}) = AddCard;
  const factory CardEvent.updated({@required Queue<MyCard> cards}) =
      CardUpdated;
}
