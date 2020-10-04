// import 'dart:convert';
import 'dart:io';

import 'package:study_buddy/domain/similarity/api_client_repository.dart';
import 'package:study_buddy/domain/similarity/similarity.dart';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
import 'package:study_buddy/domain/core/failures.dart';

class FakeHttpService {
  Future<double> getData() async {
    await Future.delayed(Duration(seconds: 1));
    // throw SocketException("Err");
    return 0.86;
  }
}

class ApiClientService implements ApiClientRepository {
  FakeHttpService fakeHttpService = FakeHttpService();

  @override
  Future<Similarity> getSimilarityScore(
      {String original, String myDefinition}) async {
    try {
      // final baseUrl = "";
      // final res = await http.get(baseUrl);
      // final Map decodedJson = jsonDecode(res.body);

      final result = await fakeHttpService.getData();
      return Similarity(similarityScore: result);
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }
}
