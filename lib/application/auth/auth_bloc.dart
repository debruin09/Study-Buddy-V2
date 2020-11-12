import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

/// This is the Auth bloc that maps incoming user events to states
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.map(authStateCheck: (_) async* {
      final isSignedInOption = await _authRepository.getSignedInUser();
      yield isSignedInOption.fold(
        () => AuthState.unauthenticated(),
        (user) => AuthState.authenticated(user: user),
      );
    }, authLoggedOut: (_) async* {
      yield AuthState.unauthenticated();
      _authRepository.signOut();
    });
  }
}
