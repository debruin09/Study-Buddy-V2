import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'similarity_failure.freezed.dart';

@freezed
abstract class SimilarityFailure with _$SimilarityFailure {
  const factory SimilarityFailure.unexpected({@required String failedMessage}) =
      _UnexpectedFailure;
}
