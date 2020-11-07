import 'package:bloc/bloc.dart';
import 'package:study_buddy/domain/core/scheduler/queue_scheduler.dart';

class QueueSchedulerCubit extends Cubit<QueueState> {
  QueueSchedulerCubit() : super(InitialQueueState());

  QueueScheduler queueScheduler;

  void queueNotifier() {
    queueScheduler.scheduleCard();
    emit(CardNotifiyQueueState());
  }

  void populate(cards) {
    queueScheduler.populate(cards);
    emit(PopulateQueueState());
  }
}

abstract class QueueState {}

class InitialQueueState extends QueueState {}

class CardNotifiyQueueState extends QueueState {}

class PopulateQueueState extends QueueState {}
