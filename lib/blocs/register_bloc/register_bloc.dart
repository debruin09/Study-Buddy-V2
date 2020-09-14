import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/repositories/auth_repository.dart';
import 'package:study_buddy/utils/validators.dart';

part 'register_event.dart';
part 'register_state.dart';

/// This is the registtation bloc that maps the register events to states
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository;

  RegisterBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if (event is RegisterUsernameChanged) {
      yield* _mapRegisterUsernameChangeToState(event.username);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(
        email: event.email,
        password: event.password,
        username: event.username,
      );
    }
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
      print(error);
      yield RegisterState.failure();
    }
  }
}
