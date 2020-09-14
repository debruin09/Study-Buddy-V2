part of 'similarity_bloc.dart';

abstract class SimilarityState extends Equatable {}

class InitialSimilarityState extends SimilarityState {
  @override
  List<Object> get props => [];
}

class SimilarityStateLoadInProgress extends SimilarityState {
  @override
  List<Object> get props => [];
}

class SimilarityStateLoadSuccess extends SimilarityState {
  final Either<Failure, Similarity> similarityScore;
  SimilarityStateLoadSuccess({
    @required this.similarityScore,
  });

  @override
  List<Object> get props => [similarityScore];
}
