part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged({@required String email}) =
      LoginEmailChange;
  const factory LoginEvent.passwordChanged({@required String password}) =
      LoginPasswordChanged;
  const factory LoginEvent.loginWithCredentials(
      {@required String email,
      @required String password}) = LoginWithCredentialsPressed;
  const factory LoginEvent.registerWithCredentials(
      {@required String email,
      @required String password}) = RegisterWithCredentialsPressed;
}
