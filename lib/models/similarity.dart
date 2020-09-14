import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class Similarity extends Equatable {
  double similarityScore;
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
