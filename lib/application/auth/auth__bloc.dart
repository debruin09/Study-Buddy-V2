import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth__bloc.freezed.dart';

/// This is the Auth bloc that maps incoming user events to states
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(
        authStarted: (_) => _mapAuthStartedToState(),
        authLoggedIn: (_) => _mapAuthLoggedInToState(),
        authLoggedOut: (_) => _mapAuthLoggedOutInToState());
  }

  //AuthLoggedOut
  Stream<AuthState> _mapAuthLoggedOutInToState() async* {
    yield AuthState.unauthenticated();
    _authRepository.signOut();
  }

  //AuthLoggedIn
  Stream<AuthState> _mapAuthLoggedInToState() async* {
    yield AuthState.authenticated(user: await _authRepository.getUser());
  }

  // AuthStarted
  Stream<AuthState> _mapAuthStartedToState() async* {
    final isSignedIn = await _authRepository.isSignedIn();
    if (isSignedIn) {
      final firebaseUser = await _authRepository.getUser();
      yield AuthState.authenticated(user: firebaseUser);
    } else {
      yield AuthState.unauthenticated();
    }
  }
}
