import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/deck_failure.dart';
import 'package:study_buddy/domain/deck/i_deck_repository.dart';

part 'deck_watcher_event.dart';
part 'deck_watcher_state.dart';
part 'deck_watcher_bloc.freezed.dart';

@injectable
class DeckWatcherBloc extends Bloc<DeckWatcherEvent, DeckWatcherState> {
  final IDeckRepository _deckRepository;

  DeckWatcherBloc(this._deckRepository)
      : super(const DeckWatcherState.initial());

  StreamSubscription<Either<DeckFailure, KtList<Deck>>> _deckStreamSubscription;

  @override
  Stream<DeckWatcherState> mapEventToState(
    DeckWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const DeckWatcherState.loadInProgress();
        await _deckStreamSubscription?.cancel();
        _deckStreamSubscription =
            _deckRepository.watchAll().listen((failureOrDecks) {
          add(DeckWatcherEvent.decksReceived(failureOrDecks));
        });
      },
      watchUnstudiedStarted: (e) async* {
        yield const DeckWatcherState.loadInProgress();
        await _deckStreamSubscription?.cancel();
        _deckStreamSubscription = _deckRepository.watchUnstudied().listen(
              (failureOrDecks) =>
                  add(DeckWatcherEvent.decksReceived(failureOrDecks)),
            );
      },
      decksReceived: (e) async* {
        yield e.failureOrDecks.fold(
          (f) => DeckWatcherState.loadFailure(f),
          (decks) => DeckWatcherState.loadSuccess(decks),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _deckStreamSubscription?.cancel();
    return super.close();
  }
}
