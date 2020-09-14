import 'dart:convert';
import 'dart:io';

import 'package:study_buddy/repositories/repositories.dart';
// import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:study_buddy/models/models.dart';
import "package:study_buddy/failures/failures.dart";

class ApiClientService implements ApiClientRepository {
  @override
  Future<Similarity> getSimilarityScore(
      {String original, String myDefinition}) async {
    try {
      final baseUrl = "";
      final res = await http.get(baseUrl);
      final Map decodedJson = jsonDecode(res.body);

      return Similarity.fromMap(decodedJson);
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }
}
