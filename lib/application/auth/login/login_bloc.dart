import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/domain/core/utils/validators.dart';

part 'login_state.dart';
part 'login_event.dart';
part 'login_bloc.freezed.dart';

/// This is the login bloc that maps incoming login events to states
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository _authRepository;

  LoginBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield* event.map(
      emailChanged: (e) => _mapLoginEmailChangeToState(e.email),
      passwordChanged: (e) => _mapLoginPasswordChangeToState(e.password),
      loginWithCredentials: (e) => _mapLoginWithCredentialsPressedToState(
          email: e.email, password: e.password),
      registerWithCredentials: (RegisterWithCredentialsPressed value) =>
          _mapRegisterWithCredentialState(
        email: value.email,
        password: value.password,
      ),
      signInWithGooglePressed: (_) => _mapRegisterWithGoogleState(),
    );
  }

  Stream<LoginState> _mapLoginEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapLoginPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      {String email, String password}) async* {
    yield LoginState.loading();
    try {
      await _authRepository.signInWithCredentials(
          emailAddress: email, password: password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapRegisterWithCredentialState(
      {String email, String password}) async* {
    yield LoginState.loading();
    try {
      await _authRepository.signUp(emailAddress: email, password: password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapRegisterWithGoogleState() async* {
    yield LoginState.loading();
    try {
      await _authRepository.signInWithGoogle();

      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
