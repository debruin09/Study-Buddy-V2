import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:study_buddy/domain/core/failures.dart';
import 'package:study_buddy/domain/similarity/similarity.dart';
import 'package:study_buddy/domain/similarity/api_client_repository.dart';

part 'similarity_event.dart';
part 'similarity_state.dart';
part 'similarity_bloc.freezed.dart';

@injectable
class SimilarityBloc extends Bloc<SimilarityEvent, SimilarityState> {
  SimilarityBloc(this.repository) : super(SimilarityState.initial());

  final ApiClientRepository repository;
  Either<Failure, Similarity> similarityScore;

  @override
  Stream<SimilarityState> mapEventToState(
    SimilarityEvent event,
  ) async* {
    if (event is GetSimilarityScoreEvent) {
      yield SimilarityState.loading();

      await Task(() => repository.getSimilarityScore(
              original: event.original, myDefinition: event.myDefinition))
          .attempt()
          .mapLeftToFailure()
          .run()
          .then((value) => similarityScore = value);

      yield SimilarityState.success(similarityScore: similarityScore);
    }
  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}