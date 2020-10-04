import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class LocalNotificationRepository {
  Future<void> notification({@required String front});
  Future<void> notificationDelay({@required String front});
  void initializing();
}
