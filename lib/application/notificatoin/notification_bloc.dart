import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/notificatoin/deck_form_helper_functions.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/i_deck_repository.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:study_buddy/domain/notification/local_notification_repository.dart';
import 'package:study_buddy/domain/notification/notification_failures.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final IDeckRepository _deckRepository;
  final LocalNotificationRepository _localNotificationRepository;

  NotificationBloc(this._deckRepository, this._localNotificationRepository)
      : super(const NotificationState.initial());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    yield* event.map(
      initialize: (_) async* {
        _localNotificationRepository.initializing();
        yield NotificationState.initial();
      },
      instantNotification: (_) async* {},
      easyNotifier: (e) async* {
        Either<NotificationFailure, Unit> failureOrSuccess;

        failureOrSuccess = await _localNotificationRepository.notificationDelay(
          deck: e.deck,
          timeDelayType: TimeDelayType.seconds,
          timeValue: 5,
          cards: e.cards,
        );

        yield* failureOrSuccess.fold((notificationFailure) async* {
          yield NotificationState.failure(notificationFailure);
        }, (_) async* {
          await _deckRepository.update(
            e.deck.copyWith(
              easyCard: EasyCard(e.deck.easyCard.getOrCrash() > 0
                  ? e.deck.easyCard.getOrCrash() - 1
                  : e.deck.easyCard.getOrCrash()),
              cards: List6(markCardAsStudied(e.cards)),
            ),
          );
          yield NotificationState.success();
        });
      },
      moderateNotifier: (e) async* {
        Either<NotificationFailure, Unit> failureOrSuccess;

        failureOrSuccess = await _localNotificationRepository.notificationDelay(
          deck: e.deck,
          timeDelayType: TimeDelayType.seconds,
          timeValue: 5,
          cards: e.cards,
        );

        yield* failureOrSuccess.fold((notificationFailure) async* {
          yield NotificationState.failure(notificationFailure);
        }, (_) async* {
          print("Success.....<Notificaton Bloc> Moderate: ");
          print("This was the counter: ${e.deck.hardCard.getOrCrash()}");
          await _deckRepository.update(
            e.deck.copyWith(
              moderateCard: ModerateCard(e.deck.moderateCard.getOrCrash() > 0
                  ? e.deck.moderateCard.getOrCrash() - 1
                  : e.deck.moderateCard.getOrCrash()),
              cards: List6(markCardAsStudied(e.cards)),
            ),
          );
          yield NotificationState.success();
        });
      },
      hardNotifier: (e) async* {
        Either<NotificationFailure, Unit> failureOrSuccess;

        failureOrSuccess = await _localNotificationRepository.notificationDelay(
          deck: e.deck,
          timeDelayType: TimeDelayType.seconds,
          timeValue: 10,
          cards: e.cards,
        );

        yield* failureOrSuccess.fold((notificationFailure) async* {
          yield NotificationState.failure(notificationFailure);
        }, (_) async* {
          await _deckRepository.update(
            e.deck.copyWith(
              hardCard: HardCard(e.deck.hardCard.getOrCrash() > 0
                  ? e.deck.hardCard.getOrCrash() - 1
                  : e.deck.hardCard.getOrCrash()),
              cards: List6(markCardAsStudied(e.cards)),
            ),
          );
          yield NotificationState.success();
        });
      },
    );
  }
}
