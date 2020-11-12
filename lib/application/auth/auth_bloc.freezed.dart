// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AuthStateCheck authStateCheck() {
    return const AuthStateCheck();
  }

// ignore: unused_element
  AuthLoggedOut authLoggedOut() {
    return const AuthLoggedOut();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authStateCheck(),
    @required Result authLoggedOut(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authStateCheck(),
    Result authLoggedOut(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authStateCheck(AuthStateCheck value),
    @required Result authLoggedOut(AuthLoggedOut value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authStateCheck(AuthStateCheck value),
    Result authLoggedOut(AuthLoggedOut value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AuthStateCheckCopyWith<$Res> {
  factory $AuthStateCheckCopyWith(
          AuthStateCheck value, $Res Function(AuthStateCheck) then) =
      _$AuthStateCheckCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCheckCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthStateCheckCopyWith<$Res> {
  _$AuthStateCheckCopyWithImpl(
      AuthStateCheck _value, $Res Function(AuthStateCheck) _then)
      : super(_value, (v) => _then(v as AuthStateCheck));

  @override
  AuthStateCheck get _value => super._value as AuthStateCheck;
}

/// @nodoc
class _$AuthStateCheck implements AuthStateCheck {
  const _$AuthStateCheck();

  @override
  String toString() {
    return 'AuthEvent.authStateCheck()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStateCheck);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authStateCheck(),
    @required Result authLoggedOut(),
  }) {
    assert(authStateCheck != null);
    assert(authLoggedOut != null);
    return authStateCheck();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authStateCheck(),
    Result authLoggedOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authStateCheck != null) {
      return authStateCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authStateCheck(AuthStateCheck value),
    @required Result authLoggedOut(AuthLoggedOut value),
  }) {
    assert(authStateCheck != null);
    assert(authLoggedOut != null);
    return authStateCheck(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authStateCheck(AuthStateCheck value),
    Result authLoggedOut(AuthLoggedOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authStateCheck != null) {
      return authStateCheck(this);
    }
    return orElse();
  }
}

abstract class AuthStateCheck implements AuthEvent {
  const factory AuthStateCheck() = _$AuthStateCheck;
}

/// @nodoc
abstract class $AuthLoggedOutCopyWith<$Res> {
  factory $AuthLoggedOutCopyWith(
          AuthLoggedOut value, $Res Function(AuthLoggedOut) then) =
      _$AuthLoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthLoggedOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthLoggedOutCopyWith<$Res> {
  _$AuthLoggedOutCopyWithImpl(
      AuthLoggedOut _value, $Res Function(AuthLoggedOut) _then)
      : super(_value, (v) => _then(v as AuthLoggedOut));

  @override
  AuthLoggedOut get _value => super._value as AuthLoggedOut;
}

/// @nodoc
class _$AuthLoggedOut implements AuthLoggedOut {
  const _$AuthLoggedOut();

  @override
  String toString() {
    return 'AuthEvent.authLoggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authStateCheck(),
    @required Result authLoggedOut(),
  }) {
    assert(authStateCheck != null);
    assert(authLoggedOut != null);
    return authLoggedOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authStateCheck(),
    Result authLoggedOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authLoggedOut != null) {
      return authLoggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authStateCheck(AuthStateCheck value),
    @required Result authLoggedOut(AuthLoggedOut value),
  }) {
    assert(authStateCheck != null);
    assert(authLoggedOut != null);
    return authLoggedOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authStateCheck(AuthStateCheck value),
    Result authLoggedOut(AuthLoggedOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authLoggedOut != null) {
      return authLoggedOut(this);
    }
    return orElse();
  }
}

abstract class AuthLoggedOut implements AuthEvent {
  const factory AuthLoggedOut() = _$AuthLoggedOut;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  AuthInitial initial() {
    return const AuthInitial();
  }

// ignore: unused_element
  Authenticated authenticated({@required User user}) {
    return Authenticated(
      user: user,
    );
  }

// ignore: unused_element
  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthInitialCopyWith<$Res> {
  factory $AuthInitialCopyWith(
          AuthInitial value, $Res Function(AuthInitial) then) =
      _$AuthInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthInitialCopyWith<$Res> {
  _$AuthInitialCopyWithImpl(
      AuthInitial _value, $Res Function(AuthInitial) _then)
      : super(_value, (v) => _then(v as AuthInitial));

  @override
  AuthInitial get _value => super._value as AuthInitial;
}

/// @nodoc
class _$AuthInitial implements AuthInitial {
  const _$AuthInitial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitial;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(Authenticated(
      user: user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$Authenticated implements Authenticated {
  const _$Authenticated({@required this.user}) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Authenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated({@required User user}) = _$Authenticated;

  User get user;
  $AuthenticatedCopyWith<Authenticated> get copyWith;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc
class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}
