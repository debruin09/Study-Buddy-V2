part of 'notification_bloc.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.success() = _NotificationSuccess;
  const factory NotificationState.failure(
      NotificationFailure notificationFailure) = _NotificationFailure;
}
