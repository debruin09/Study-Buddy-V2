import 'dart:io';

import 'package:study_buddy/domain/similarity/similarity.dart';
import 'package:study_buddy/domain/core/failures.dart';
import 'package:study_buddy/domain/similarity/api_client_repository.dart';

class HttpClient {
  Future postRequest(String original, myDefinition) async {
    await Future.delayed(Duration(seconds: 1));
    // throw SocketException("no internet connection");
    // throw HttpException("error 404");

    return {"similarityScore": 0.87};
  }
}

class FakeApiClientService implements ApiClientRepository {
  HttpClient httpClient;
  FakeApiClientService(this.httpClient);
  @override
  Future<Similarity> getSimilarityScore(
      {String original, String myDefinition}) async {
    try {
      final Map response = await httpClient.postRequest(original, myDefinition);

      return Similarity.fromMap(response);
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }
}
