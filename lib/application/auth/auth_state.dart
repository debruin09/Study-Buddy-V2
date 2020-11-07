part of 'auth__bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.authenticated({@required User user}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
