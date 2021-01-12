part of 'similarity_bloc.dart';

@freezed
abstract class SimilarityEvent with _$SimilarityEvent {
  const factory SimilarityEvent.getSimialrityScore(
      {@required String original,
      @required String myDefinition}) = _SimialrityScore;
}
