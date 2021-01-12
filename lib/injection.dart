import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:study_buddy/application/similarity/similarity_bloc.dart';
import 'package:study_buddy/application/speech/speech_bloc.dart';
import 'package:study_buddy/domain/similarity/api_client_repository.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/infrastructure/core/image_service.dart';
import 'package:study_buddy/infrastructure/core/storage_service.dart';
import 'package:study_buddy/infrastructure/similarity/api_client_service.dart';
import 'package:study_buddy/injection.config.dart';
import 'package:study_buddy/presentation/home/misc/deck_singleton.dart';
import 'package:study_buddy/presentation/pomodoro/misc/pomodoro_settings.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<ApiClientRepository>(() => ApiClientService());
  locator.registerFactory<SimilarityBloc>(() => SimilarityBloc(locator()));
  locator.registerLazySingleton<DeckSingleton>(() => DeckSingleton());
  locator.registerLazySingleton<ImageFileDetails>(() => ImageFileDetails());
  locator.registerLazySingleton<ImageService>(() => ImageService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<ChosenDeck>(() => ChosenDeck());
  locator.registerFactory<SpeechBloc>(() => SpeechBloc());
}

@injectableInit
void configureInjection(String env) {
  $initGetIt(locator, environment: env);
}
