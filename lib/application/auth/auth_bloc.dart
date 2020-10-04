import 'package:equatable/equatable.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// This is the Auth bloc that maps incoming user events to states
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStarted) {
      yield* _mapAuthStartedToState();
    } else if (event is AuthLoggedIn) {
      yield* _mapAuthLoggedInToState();
    } else if (event is AuthLoggedOut) {
      yield* _mapAuthLoggedOutInToState();
    }
  }

  //AuthLoggedOut
  Stream<AuthState> _mapAuthLoggedOutInToState() async* {
    yield AuthFailure();
    _authRepository.signOut();
  }

  //AuthLoggedIn
  Stream<AuthState> _mapAuthLoggedInToState() async* {
    yield AuthSuccess(await _authRepository.getUser());
  }

  // AuthStarted
  Stream<AuthState> _mapAuthStartedToState() async* {
    final isSignedIn = await _authRepository.isSignedIn();
    if (isSignedIn) {
      final firebaseUser = await _authRepository.getUser();
      yield AuthSuccess(firebaseUser);
    } else {
      yield AuthFailure();
    }
  }
}
