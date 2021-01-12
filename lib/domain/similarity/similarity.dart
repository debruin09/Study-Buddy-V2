import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Checks the similarity between the original definition
/// and the users definition, then outputs a double value
/// between 0 - 1
class Similarity extends Equatable {
  final double similarityScore;
  Similarity({@required this.similarityScore})
      : assert(similarityScore != null);

  @override
  List<Object> get props => [similarityScore];

  @override
  String toString() => "Similarity { similarityScore : $similarityScore}";

  Map<String, dynamic> toMap() {
    return {
      'similarityScore': similarityScore,
    };
  }

  static Similarity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Similarity(
      similarityScore: map['similarityScore'],
    );
  }
}
