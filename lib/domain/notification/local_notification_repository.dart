import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/notification/notification_failures.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

abstract class LocalNotificationRepository {
  Future<void> notification({@required Deck deck});
  Future<Either<NotificationFailure, Unit>> notificationDelay({
    @required Deck deck,
    @required TimeDelayType timeDelayType,
    @required int timeValue,
    @required KtList<CardItemPrimitive> cards,
  });
  void initializing();
}

enum TimeDelayType { seconds, days, minutes }
