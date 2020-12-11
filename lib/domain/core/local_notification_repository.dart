import 'package:flutter/foundation.dart';
import 'package:study_buddy/domain/deck/deck.dart';

abstract class LocalNotificationRepository {
  Future<void> notification({@required Deck deck});
  Future<void> notificationDelay(
      {@required Deck deck,
      @required TimeDelayType timeDelayType,
      @required int timeValue});
  void initializing();
}

enum TimeDelayType { seconds, days, minutes }
