part of 'similarity_bloc.dart';

abstract class SimilarityEvent extends Equatable {}

class GetSimilarityScoreEvent extends SimilarityEvent {
  final String original, myDefinition;

  GetSimilarityScoreEvent(
      {@required this.original, @required this.myDefinition});

  @override
  List<Object> get props => [original, myDefinition];
}
