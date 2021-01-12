import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/similarity/similarity.dart';
import 'package:study_buddy/domain/similarity/api_client_repository.dart';
import 'package:study_buddy/domain/similarity/similarity_failure.dart';

part 'similarity_event.dart';
part 'similarity_state.dart';
part 'similarity_bloc.freezed.dart';

class SimilarityBloc extends Bloc<SimilarityEvent, SimilarityState> {
  SimilarityBloc(this.repository) : super(SimilarityState.initial());

  final ApiClientRepository repository;
  Either<SimilarityFailure, Similarity> failureOrSimialrity;

  @override
  Stream<SimilarityState> mapEventToState(
    SimilarityEvent event,
  ) async* {
    yield* event.map(getSimialrityScore: (e) async* {
      yield SimilarityState.loading();

      await Task(() => repository.getSimilarityScore(
              original: event.original, myDefinition: event.myDefinition))
          .attempt()
          .mapLeftToFailure()
          .run()
          .then((value) => failureOrSimialrity = value);

      yield failureOrSimialrity.fold(
        (failure) => SimilarityState.failed(similarityFailure: failure),
        (similarity) => SimilarityState.success(similarityScore: similarity),
      );
    });
  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<SimilarityFailure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as SimilarityFailure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
