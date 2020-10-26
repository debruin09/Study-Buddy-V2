import 'package:flutter/foundation.dart';

abstract class LocalNotificationRepository {
  Future<void> notification({@required String front});
  Future<void> notificationDelay({@required String front});
  void initializing();
}
