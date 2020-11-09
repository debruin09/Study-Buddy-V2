import 'dart:collection';

import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';

class QueueScheduler {
  Queue<MyCard> q1 = Queue<MyCard>();
  Queue<MyCard> q2 = Queue<MyCard>();
  final LocalNotificationRepository notificationService;
  bool isFinished = false;

  int lengthAfterPopulation = 0;

  int hard = 0;
  int easy = 0;
  int moderate = 0;

  QueueScheduler(this.notificationService);

  /// Populate's the queue with the cards from the database
  void populate(Queue<MyCard> cards) {
    q1.addAll(cards);

    lengthAfterPopulation = q1.length;
  }

  /// Clears the queue, and values
  void clear() {
    q1.clear();
    q2.clear();
    hard = 0;
    moderate = 0;
    easy = 0;
  }

  /// Removes the first [MyCard] from the first queue, then creates a backup of that card
  /// Then it notifies the user of the card;
  void scheduleCard(DifficultyState difficulty) {
    if (q1.isNotEmpty) {
      final scheduledCard = q1.removeFirst();
      q2.add(scheduledCard);
      notificationService.notification(front: scheduledCard.front);

      if (difficulty == DifficultyState.hard)
        hard++;
      else if (difficulty == DifficultyState.moderate)
        moderate++;
      else
        easy++;
      print("\n { Original: ${q1.length} == Copy: ${q2.length} }\n");
    }
  }

  bool isEmptyAfterPopulation() {
    if (lengthAfterPopulation == q2.length) {
      return true;
    }
    return false;
  }
}

enum DifficultyState { easy, moderate, hard }
