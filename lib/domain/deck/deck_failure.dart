import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_failure.freezed.dart';

@freezed
abstract class DeckFailure with _$DeckFailure {
  const factory DeckFailure.unexpected() = _Unexpected;
  const factory DeckFailure.insufficientPermission() = _InsufficientPermission;
  const factory DeckFailure.unableToUpdate() = _UnableToUpdate;
}
