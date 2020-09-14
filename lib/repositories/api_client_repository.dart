import 'package:flutter/foundation.dart';
import 'package:study_buddy/models/similarity.dart';

abstract class ApiClientRepository {
  Future<Similarity> getSimilarityScore(
      {@required String original, String myDefinition});
}
