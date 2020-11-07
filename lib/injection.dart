import 'package:get_it/get_it.dart';
import 'package:study_buddy/application/auth/auth__bloc.dart';
import 'package:study_buddy/application/auth/login/login_bloc.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/core/speech/speech_bloc.dart';
import 'package:study_buddy/application/deck/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/application/similarity/similarity_bloc/similarity_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:study_buddy/domain/core/database_repository.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:study_buddy/domain/core/scheduler/queue_scheduler.dart';
import 'package:study_buddy/domain/similarity/api_client_repository.dart';
import 'package:study_buddy/infrastructure/auth/auth_service.dart';
import 'package:study_buddy/infrastructure/core/database_service.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/infrastructure/core/local_notification_service.dart';
import 'package:study_buddy/infrastructure/core/tag_service.dart';
import 'package:study_buddy/infrastructure/similarity/api_client_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<ApiClientRepository>(() => ApiClientService());
  locator.registerFactory<CardBloc>(() => CardBloc(locator()));
  locator.registerFactory<DeckBloc>(() => DeckBloc(locator()));
  locator.registerLazySingleton<DeckStatusCubit>(() => DeckStatusCubit());
  locator.registerLazySingleton<CardStatusCubit>(() => CardStatusCubit());
  locator.registerFactory<SimilarityBloc>(() => SimilarityBloc(locator()));
  locator.registerLazySingleton<DecksScope>(() => DecksScope());
  locator.registerLazySingleton<GlobalId>(() => GlobalId());
  locator.registerLazySingleton<AuthRepository>(() => AuthService());
  locator.registerLazySingleton<DatabaseRepository>(() => FirestoreService());
  locator.registerFactory<QueueScheduler>(() => QueueScheduler(locator()));
  locator.registerFactory<TagService>(() => TagService());
  locator.registerFactory<LocalNotificationRepository>(
      () => LocalNotificationService());
  locator
      .registerFactory<LoginBloc>(() => LoginBloc(authRepository: locator()));
  locator.registerFactory<AuthBloc>(() => AuthBloc(authRepository: locator()));
  locator.registerFactory<SpeechBloc>(() => SpeechBloc());
}
