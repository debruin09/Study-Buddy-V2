part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authStateCheck() = AuthStateCheck;
  const factory AuthEvent.authLoggedOut() = AuthLoggedOut;
}
