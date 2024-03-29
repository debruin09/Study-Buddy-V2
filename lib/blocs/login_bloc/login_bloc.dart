import 'package:equatable/equatable.dart';
import 'package:study_buddy/repositories/auth_repository.dart';
import 'package:study_buddy/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';

/// This is the login bloc that maps incoming login events to states
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository _authRepository;

  LoginBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChange) {
      yield* _mapLoginEmailChangeToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangeToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
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
      await _authRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
