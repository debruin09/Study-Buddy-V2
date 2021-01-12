part of 'notification_bloc.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initialize() = _Initialize;
  const factory NotificationEvent.instantNotification() = _InstantNotification;
  const factory NotificationEvent.easyNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) = _EasyNotifier;
  const factory NotificationEvent.moderateNotifier(
      {@required Deck deck,
      KtList<CardItemPrimitive> cards}) = _ModerateNotfier;
  const factory NotificationEvent.hardNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) = _HardNotifier;
}
