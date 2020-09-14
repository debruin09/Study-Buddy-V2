import 'package:get_it/get_it.dart';
import 'package:study_buddy/blocs/auth_bloc/auth_bloc.dart';
import 'package:study_buddy/blocs/cardwatcher/cardwatcher_bloc.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/blocs/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/blocs/card_bloc/card_bloc.dart';
import 'package:study_buddy/blocs/similarity_bloc/similarity_bloc.dart';
import 'package:study_buddy/fakes/fake_services.dart';
import 'package:study_buddy/repositories/repositories.dart';
import 'package:study_buddy/services/helper_service.dart';
import 'package:study_buddy/services/services.dart';

final locator = GetIt.instance;
const USE_FAKE_IMPLEMENTATION = false;
void setupLocator() {
  ///[Repositories]
  locator.registerLazySingleton<DatabaseRepository>(() => FirestoreService());

  locator.registerLazySingleton<ApiClientRepository>(
      () => FakeApiClientService(HttpClient()));
  locator.registerLazySingleton<TagRepository>(() => TagService());
  locator.registerLazySingleton<AuthRepository>(() => AuthService());

  /// [Services]
  // locator.registerLazySingleton<TagRepository>(() => TagService());

  /// Local Notification
  locator.registerLazySingleton<LocalNotificationRepository>(
      () => LocalNotificationService());

  /// [Helper Services] for global scope
  locator.registerLazySingleton<GlobalId>(() => GlobalId());
  locator.registerLazySingleton<CardNotification>(() => CardNotification());
  locator.registerLazySingleton<DeckStatusCubit>(() => DeckStatusCubit());
  locator.registerLazySingleton<CardStatusCubit>(() => CardStatusCubit());

  /// [Blocs]

  locator.registerFactory<DeckBloc>(() => DeckBloc(locator()));
  locator.registerFactory<SimilarityBloc>(() => SimilarityBloc(locator()));
  locator.registerFactory<CardBloc>(() => CardBloc(locator()));
  locator.registerFactory<AuthBloc>(() => AuthBloc(authRepository: locator()));
  locator.registerFactory<CardWatcherBloc>(
      () => CardWatcherBloc(databaseRepository: locator()));
}
