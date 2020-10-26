// TimeIntervalWidget
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/study/widgets/folding_cell_card_wrapper.dart';

final showAnswerProvider = StateProvider((ref) => false);

class TimeIntervalWidget extends ConsumerWidget {
  final LocalNotificationRepository notificationRepository;

  TimeIntervalWidget({
    Key key,
    this.notificationRepository,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isShowAnswer = watch(showAnswerProvider).state;
    final q = watch(queueProvider);

    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: !isShowAnswer
          ? Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 13.0, top: 10.0),
              child: MaterialButton(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () => context.read(showAnswerProvider).state = true,
                child: Text(
                  "show answer",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                minWidth: double.infinity,
                height: 50,
              ),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Difficulty(
                      color: Colors.white,
                      iconColor: primaryColor,
                      icon: Icons.thumb_down,
                      label: "bad",
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                      pressed: () {
                        context.read(showAnswerProvider).state = false;
                        final firstItem = q.removeFirst();
                        notificationRepository.notification(
                            front: firstItem.front);
                        q.addLast(firstItem);
                      },
                    ),
                  ),
                  Expanded(
                    child: Difficulty(
                      color: primaryColor,
                      iconColor: Colors.white,
                      label: "moderate",
                      icon: Icons.star_half,
                      pressed: () {
                        context.read(showAnswerProvider).state = false;
                        final firstItem = q.removeFirst();
                        notificationRepository.notification(
                            front: firstItem.front);
                        q.addLast(firstItem);
                      },
                    ),
                  ),
                  Expanded(
                    child: Difficulty(
                      color: Colors.white,
                      iconColor: primaryColor,
                      icon: Icons.thumb_up,
                      label: "good",
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      pressed: () {
                        context.read(showAnswerProvider).state = false;
                        final firstItem = q.removeFirst();
                        notificationRepository.notification(
                            front: firstItem.front);
                        q.addLast(firstItem);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class Difficulty extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function pressed;
  final Color color;
  final Color iconColor;
  final BorderRadiusGeometry borderRadius;

  const Difficulty(
      {Key key,
      this.icon,
      this.label,
      this.pressed,
      this.color,
      this.borderRadius,
      this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              "$label",
              style: TextStyle(fontWeight: FontWeight.bold, color: iconColor),
            ),
            Icon(
              icon,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
