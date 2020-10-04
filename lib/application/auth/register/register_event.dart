part of 'register_bloc.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.emailChanged({@required String email}) =
      RegisterEmailChanged;
  const factory RegisterEvent.usernameChanged({@required String username}) =
      RegisterUsernameChanged;
  const factory RegisterEvent.passwordChanged({@required String password}) =
      RegisterPasswordChanged;
  const factory RegisterEvent.regiserWithCredentials({
    @required String email,
    @required String password,
    @required String username,
  }) = RegisterSubmitted;
}
