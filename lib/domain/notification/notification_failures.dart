import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_failures.freezed.dart';

@freezed
abstract class NotificationFailure with _$NotificationFailure {
  const factory NotificationFailure.argumentError() = _NotificationArgError;
  const factory NotificationFailure.unexpected() = _NotificationUnexpectedError;
}
