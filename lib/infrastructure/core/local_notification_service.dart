import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:timezone/browser.dart' as br;

class LocalNotificationService implements LocalNotificationRepository {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  @override
  Future<void> notification({@required String front}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'Channel ID', 'Channel title', 'channel body',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Study card.', '$front', notificationDetails);
  }

  /// Delayes the time for the notification to show
  /// The default [TimeDelayType] is in seconds
  @override
  Future<void> notificationDelay(
      {@required String front,
      @required TimeDelayType timeDelayType,
      @required int timeValue}) async {
    // The device's timezone.
    String timeZoneName = "South Africa/Johannesburg";

    // Find the 'current location'
    final location = br.getLocation(timeZoneName);

    var timeDelayed;
    tz.TZDateTime zone;

    if (timeDelayType == TimeDelayType.minutes) {
      timeDelayed = DateTime.now().add(Duration(minutes: timeValue));
      zone = tz.TZDateTime.from(timeDelayed, location);
    } else if (timeDelayType == TimeDelayType.days) {
      timeDelayed = DateTime.now().add(Duration(seconds: timeValue));
      zone = tz.TZDateTime.from(timeDelayed, location);
    } else {
      timeDelayed = DateTime.now().add(Duration(seconds: timeValue));
      zone = tz.TZDateTime.from(timeDelayed, location);
    }

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'second channel ID', 'second Channel title', 'second channel body',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1, 'Study card.', '$front', zone, notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true);
  }

  Future<void> onSelectNotification(String payLoad) async {
    if (payLoad != null) {
      print("This is the payload; $payLoad");
    }
    // ExtendedNavigator.root.push(Routes.deckStudyPage, arguments: DeckStudyPageArguments(deck: deck));
    // we can set navigator to navigate another screen
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }
}
