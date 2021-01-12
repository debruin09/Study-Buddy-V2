part of 'similarity_bloc.dart';

@freezed
abstract class SimilarityState with _$SimilarityState {
  factory SimilarityState.initial() = _InitialSimilarityState;
  factory SimilarityState.loading() = _LoadSimilarityState;
  factory SimilarityState.success({@required Similarity similarityScore}) =
      _SuccessSimilarityState;
  factory SimilarityState.failed(
          {@required SimilarityFailure similarityFailure}) =
      _FailureSimilarityState;
}
