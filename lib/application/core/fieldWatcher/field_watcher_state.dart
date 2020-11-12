part of 'field_watcher_bloc.dart';

@freezed
abstract class FieldWatcherState with _$FieldWatcherState {
  const factory FieldWatcherState.initial() = _Initial;
  const factory FieldWatcherState.empty() = _Empty;
  const factory FieldWatcherState.value({@required String value}) = _FieldValue;
}
