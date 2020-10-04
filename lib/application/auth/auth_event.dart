part of "auth_bloc.dart";

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authStarted() = AuthStarted;

  const factory AuthEvent.authLoggedIn() = AuthLoggedIn;

  const factory AuthEvent.authLoggedOut() = AuthLoggedOut;
}
