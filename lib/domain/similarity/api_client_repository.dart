import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:study_buddy/domain/similarity/similarity.dart';
import 'package:study_buddy/domain/similarity/similarity_failure.dart';

abstract class ApiClientRepository {
  Future<Either<SimilarityFailure, Similarity>> getSimilarityScore(
      {@required String original, @required String myDefinition});
}
