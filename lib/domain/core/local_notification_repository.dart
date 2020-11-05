import 'package:flutter/foundation.dart';

abstract class LocalNotificationRepository {
  Future<void> notification({@required String front});
  Future<void> notificationDelay(
      {@required String front,
      @required TimeDelayType timeDelayType,
      @required int timeValue});
  void initializing();
}

enum TimeDelayType { seconds, days, minutes }
