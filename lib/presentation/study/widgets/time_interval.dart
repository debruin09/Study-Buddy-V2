// TimeIntervalWidget
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/card/card_list_notifier.dart';
import 'package:study_buddy/application/deck/deck_notifier.dart';
import 'package:study_buddy/presentation/study/widgets/folding_cell_card_wrapper.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:study_buddy/presentation/theme/theme_colors.dart';

final showAnswerProvider = StateProvider((ref) => false);

class TimeIntervalWidget extends ConsumerWidget {
  final LocalNotificationRepository notificationRepository;

// TODO: ADD NOTIFICATION ICON
  TimeIntervalWidget({
    Key key,
    this.notificationRepository,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isShowAnswer = watch(showAnswerProvider).state;
    final currentCard = watch(currentCardProvider).state;
    final val = watch(deckStreamProvider);

    print("This is the value...$val");

    return Material(
      color: bgColor,
      child: !isShowAnswer
          ? MaterialButton(
              color: bgColor,
              onPressed: () => context.read(showAnswerProvider).state = true,
              child: Text(
                "Show Answer",
                style: TextStyle(fontSize: 20.0),
              ),
              minWidth: double.infinity,
              height: 70,
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: TimeIntervalItem(
                    icon: Icons.thumb_down,
                    label: "bad",
                    pressed: () {
                      context.read(showAnswerProvider).state = false;
                      context.read(cardsProvider).state++;
                      notificationRepository.notification(
                          front: currentCard.front);
                    },
                  ),
                ),
                Expanded(
                  child: TimeIntervalItem(
                    label: "again",
                    icon: Icons.star_half,
                    pressed: () {
                      context.read(showAnswerProvider).state = false;
                      context.read(cardsProvider).state++;
                      notificationRepository.notificationDelay(
                          front: currentCard.front);
                    },
                  ),
                ),
                Expanded(
                  child: TimeIntervalItem(
                    icon: Icons.thumb_up,
                    label: "good",
                    pressed: () {
                      context.read(showAnswerProvider).state = false;
                      context.read(cardsProvider).state++;
                      notificationRepository.notification(
                          front: currentCard.front);
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              "$label",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
