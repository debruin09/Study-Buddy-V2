import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_type_case.freezed.dart';

@freezed
abstract class CardTypeCase with _$CardTypeCase {
  const factory CardTypeCase.front() = _Front;
  const factory CardTypeCase.back() = _Back;
  const factory CardTypeCase.me() = _Me;
}
