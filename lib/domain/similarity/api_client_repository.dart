import 'package:flutter/foundation.dart';
import 'package:study_buddy/domain/similarity/similarity.dart';

abstract class ApiClientRepository {
  Future<Similarity> getSimilarityScore(
      {@required String original, @required String myDefinition});
}
