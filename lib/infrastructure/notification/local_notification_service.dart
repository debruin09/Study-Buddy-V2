import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/notification/local_notification_repository.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/notification/notification_failures.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'dart:math';

@LazySingleton(as: LocalNotificationRepository)
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
  Future<void> notification({@required Deck deck}) async {
    final front = deck.cards.getOrCrash().first().front.getOrCrash();

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
  Future<Either<NotificationFailure, Unit>> notificationDelay({
    @required Deck deck,
    @required TimeDelayType timeDelayType,
    @required int timeValue,
    @required KtList<CardItemPrimitive> cards,
  }) async {
    tz.TZDateTime zone;
    final card = cards.firstOrNull((card) => card.studied);
    final now = DateTime.now();
    final Random rndNum = Random(now.millisecondsSinceEpoch);

    if (timeDelayType == TimeDelayType.seconds) {
      zone = tz.TZDateTime.now(tz.local).add(Duration(seconds: timeValue));
    } else if (timeDelayType == TimeDelayType.days) {
      zone = tz.TZDateTime.now(tz.local).add(Duration(days: timeValue));
    } else {
      zone = tz.TZDateTime.now(tz.local).add(Duration(minutes: timeValue));
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

    try {
      if (timeDelayType == TimeDelayType.seconds) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            rndNum.nextInt(20),
            'Ready to study ${deck.name.getOrCrash()}',
            '${card.front}',
            zone,
            notificationDetails,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.wallClockTime,
            androidAllowWhileIdle: true);
      } else if (timeDelayType == TimeDelayType.days) {
        await Future.delayed(Duration(days: timeValue), () async {});
      } else {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            rndNum.nextInt(20),
            'Ready to study ${deck.name.getOrCrash()}',
            '${card.front}',
            zone,
            notificationDetails,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.wallClockTime,
            androidAllowWhileIdle: true);
      }
      return right(unit);
    } on ArgumentError catch (e) {
      print("Notification error: $e.");
      return left(const NotificationFailure.argumentError());
    }
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
