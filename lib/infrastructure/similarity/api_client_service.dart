// import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:study_buddy/domain/similarity/api_client_repository.dart';
import 'package:study_buddy/domain/similarity/similarity.dart';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;

class FakeHttpService {
  Future<double> getData() async {
    final _rand = new Random();
    final r = 4 + _rand.nextInt(5).toDouble();
    await Future.delayed(Duration(seconds: 1));
    // throw SocketException("Err");
    return r * 10;
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

class Failure {
  final String message;

  Failure(this.message);
}
