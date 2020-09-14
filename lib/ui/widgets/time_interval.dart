// TimeIntervalWidget
import 'package:flutter/material.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/repositories/local_notification_repository.dart';
import 'package:study_buddy/services/services.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';

class TimeIntervalWidget extends StatelessWidget {
  final LocalNotificationRepository notificationRepository;
  final CardNotification _cardNotification = locator.get<CardNotification>();

// TODO: ADD NOTIFICATION ICON
  TimeIntervalWidget({
    Key key,
    this.notificationRepository,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TimeIntervalItem(
              icon: Icons.thumb_down,
              label: "bad",
              pressed: () {
                print("Notification executed...");
                notificationRepository.notification(
                    front: _cardNotification.card.front);
              },
            ),
          ),
          Expanded(
            child: TimeIntervalItem(
              label: "again",
              icon: Icons.star_half,
              pressed: () {
                notificationRepository.notificationDelay(
                    front: _cardNotification.card.front);
              },
            ),
          ),
          Expanded(
            child: TimeIntervalItem(
              icon: Icons.thumb_up,
              label: "good",
              pressed: () {
                notificationRepository.notification(
                    front: _cardNotification.card.front);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// TimeIntervalItem
class TimeIntervalItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function pressed;

  const TimeIntervalItem({
    Key key,
    this.icon,
    this.label,
    this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: cardColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: <Widget>[
              Text(
                "$label",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
