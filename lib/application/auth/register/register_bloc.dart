import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:study_buddy/domain/core/utils/validators.dart';

part 'register_event.dart';
part 'register_state.dart';

part 'register_bloc.freezed.dart';

/// This is the registtation bloc that maps the register events to states
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository;

  RegisterBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield* event.map(
      emailChanged: (e) => _mapRegisterEmailChangeToState(e.email),
      usernameChanged: (e) => _mapRegisterUsernameChangeToState(e.username),
      passwordChanged: (e) => _mapRegisterPasswordChangeToState(e.password),
      regiserWithCredentials: (e) => _mapRegisterSubmittedToState(
          email: e.email, password: e.password, username: e.username),
    );
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapRegisterUsernameChangeToState(
      String username) async* {
    yield state.update(isUsernameValid: Validators.isValidUsername(username));
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(
      String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<RegisterState> _mapRegisterSubmittedToState({
    String email,
    String password,
    String username,
  }) async* {
    yield RegisterState.loading();
    try {
      await _authRepository.signUp(
        username,
        email,
        password,
      );
      yield RegisterState.success();
    } catch (error) {
      print("This was the register error; $error ");
      yield RegisterState.failure();
    }
  }
}
