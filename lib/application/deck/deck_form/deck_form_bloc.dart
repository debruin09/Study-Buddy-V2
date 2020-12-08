import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_helper_functions.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/deck_failure.dart';
import 'package:study_buddy/domain/deck/i_deck_repository.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

part 'deck_form_event.dart';
part 'deck_form_state.dart';
part 'deck_form_bloc.freezed.dart';

@injectable
class DeckFormBloc extends Bloc<DeckFormEvent, DeckFormState> {
  final IDeckRepository _deckRepository;

  DeckFormBloc(this._deckRepository) : super(DeckFormState.initial());
  @override
  Stream<DeckFormState> mapEventToState(
    DeckFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialDeckOption.fold(
          () => state,
          (initialDeck) => state.copyWith(
            deck: initialDeck,
            isEditing: true,
          ),
        );
      },
      nameChanged: (e) async* {
        yield state.copyWith(
          deck: state.deck.copyWith(name: DeckName(e.nameStr)),
          saveFailureOrSuccessOption: none(),
        );
      },

      easyIncrement: (e) async* {
        final counter = state.deck.easyCard.getOrCrash();

        await _deckRepository.update(
          state.deck.copyWith(
            easyCard: EasyCard(counter + 1),
            cards: List6(deckFormHelperFunction(state.deck)),
          ),
        );

        yield state;
      },
      moderateIncrement: (e) async* {
        final counter = state.deck.moderateCard.getOrCrash();

        await _deckRepository.update(state.deck.copyWith(
          moderateCard: ModerateCard(counter + 1),
          cards: List6(deckFormHelperFunction(state.deck)),
        ));
        yield state;
      },
      hardIncrement: (e) async* {
        final counter = state.deck.hardCard.getOrCrash();
        await _deckRepository.update(state.deck.copyWith(
          hardCard: HardCard(counter + 1),
          cards: List6(deckFormHelperFunction(state.deck)),
        ));
        yield state;
      },

      ///  Checks the failure option before creating or updating
      /// the deck
      /// 1. yields a state that the deck is in the process of saving
      ///   and there is no failure or success option
      saved: (e) async* {
        Either<DeckFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        /// Is there a failure or not, if it is none:
        if (state.deck.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _deckRepository.update(state.deck)
              : await _deckRepository.create(state.deck);
        }

        /// Incase of a failure yield this error case
        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
      cardsChanged: (e) async* {
        yield state.copyWith(
          deck: state.deck.copyWith(
            cards: List6(e.cards.map((primitive) => primitive.toDomain())),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
    );
  }
}
