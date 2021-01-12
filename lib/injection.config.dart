// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'application/auth/auth_bloc.dart';
import 'application/deck/deck_actor/deck_actor_bloc.dart';
import 'application/deck/deck_form/deck_form_bloc.dart';
import 'infrastructure/deck/deck_repository.dart';
import 'application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'infrastructure/auth/firebase_auth_facade.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'domain/auth/i_auth_facade.dart';
import 'domain/deck/i_deck_repository.dart';
import 'domain/notification/local_notification_repository.dart';
import 'infrastructure/notification/local_notification_service.dart';
import 'application/notificatoin/notification_bloc.dart';
import 'application/auth/sign_in_form/sign_in_form_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
      firebaseAuth: get<FirebaseAuth>(), googleSignIn: get<GoogleSignIn>()));
  gh.lazySingleton<IDeckRepository>(
      () => DeckRepository(get<FirebaseFirestore>()));
  gh.lazySingleton<LocalNotificationRepository>(
      () => LocalNotificationService());
  gh.factory<NotificationBloc>(() => NotificationBloc(
      get<IDeckRepository>(), get<LocalNotificationRepository>()));
  gh.factory<SignInFormBloc>(() => SignInFormBloc(get<IAuthFacade>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  gh.factory<DeckActorBloc>(() => DeckActorBloc(get<IDeckRepository>()));
  gh.factory<DeckFormBloc>(() => DeckFormBloc(get<IDeckRepository>()));
  gh.factory<DeckWatcherBloc>(() => DeckWatcherBloc(get<IDeckRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
