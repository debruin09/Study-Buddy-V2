// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegisterEventTearOff {
  const _$RegisterEventTearOff();

// ignore: unused_element
  RegisterEmailChanged emailChanged({@required String email}) {
    return RegisterEmailChanged(
      email: email,
    );
  }

// ignore: unused_element
  RegisterUsernameChanged usernameChanged({@required String username}) {
    return RegisterUsernameChanged(
      username: username,
    );
  }

// ignore: unused_element
  RegisterPasswordChanged passwordChanged({@required String password}) {
    return RegisterPasswordChanged(
      password: password,
    );
  }

// ignore: unused_element
  RegisterSubmitted regiserWithCredentials(
      {@required String email,
      @required String password,
      @required String username}) {
    return RegisterSubmitted(
      email: email,
      password: password,
      username: username,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RegisterEvent = _$RegisterEventTearOff();

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result usernameChanged(String username),
    @required Result passwordChanged(String password),
    @required
        Result regiserWithCredentials(
            String email, String password, String username),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result usernameChanged(String username),
    Result passwordChanged(String password),
    Result regiserWithCredentials(
        String email, String password, String username),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(RegisterEmailChanged value),
    @required Result usernameChanged(RegisterUsernameChanged value),
    @required Result passwordChanged(RegisterPasswordChanged value),
    @required Result regiserWithCredentials(RegisterSubmitted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(RegisterEmailChanged value),
    Result usernameChanged(RegisterUsernameChanged value),
    Result passwordChanged(RegisterPasswordChanged value),
    Result regiserWithCredentials(RegisterSubmitted value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  final RegisterEvent _value;
  // ignore: unused_field
  final $Res Function(RegisterEvent) _then;
}

/// @nodoc
abstract class $RegisterEmailChangedCopyWith<$Res> {
  factory $RegisterEmailChangedCopyWith(RegisterEmailChanged value,
          $Res Function(RegisterEmailChanged) then) =
      _$RegisterEmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$RegisterEmailChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterEmailChangedCopyWith<$Res> {
  _$RegisterEmailChangedCopyWithImpl(
      RegisterEmailChanged _value, $Res Function(RegisterEmailChanged) _then)
      : super(_value, (v) => _then(v as RegisterEmailChanged));

  @override
  RegisterEmailChanged get _value => super._value as RegisterEmailChanged;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(RegisterEmailChanged(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$RegisterEmailChanged implements RegisterEmailChanged {
  const _$RegisterEmailChanged({@required this.email}) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterEmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $RegisterEmailChangedCopyWith<RegisterEmailChanged> get copyWith =>
      _$RegisterEmailChangedCopyWithImpl<RegisterEmailChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result usernameChanged(String username),
    @required Result passwordChanged(String password),
    @required
        Result regiserWithCredentials(
            String email, String password, String username),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result usernameChanged(String username),
    Result passwordChanged(String password),
    Result regiserWithCredentials(
        String email, String password, String username),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(RegisterEmailChanged value),
    @required Result usernameChanged(RegisterUsernameChanged value),
    @required Result passwordChanged(RegisterPasswordChanged value),
    @required Result regiserWithCredentials(RegisterSubmitted value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(RegisterEmailChanged value),
    Result usernameChanged(RegisterUsernameChanged value),
    Result passwordChanged(RegisterPasswordChanged value),
    Result regiserWithCredentials(RegisterSubmitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class RegisterEmailChanged implements RegisterEvent {
  const factory RegisterEmailChanged({@required String email}) =
      _$RegisterEmailChanged;

  String get email;
  $RegisterEmailChangedCopyWith<RegisterEmailChanged> get copyWith;
}

/// @nodoc
abstract class $RegisterUsernameChangedCopyWith<$Res> {
  factory $RegisterUsernameChangedCopyWith(RegisterUsernameChanged value,
          $Res Function(RegisterUsernameChanged) then) =
      _$RegisterUsernameChangedCopyWithImpl<$Res>;
  $Res call({String username});
}

/// @nodoc
class _$RegisterUsernameChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterUsernameChangedCopyWith<$Res> {
  _$RegisterUsernameChangedCopyWithImpl(RegisterUsernameChanged _value,
      $Res Function(RegisterUsernameChanged) _then)
      : super(_value, (v) => _then(v as RegisterUsernameChanged));

  @override
  RegisterUsernameChanged get _value => super._value as RegisterUsernameChanged;

  @override
  $Res call({
    Object username = freezed,
  }) {
    return _then(RegisterUsernameChanged(
      username: username == freezed ? _value.username : username as String,
    ));
  }
}

/// @nodoc
class _$RegisterUsernameChanged implements RegisterUsernameChanged {
  const _$RegisterUsernameChanged({@required this.username})
      : assert(username != null);

  @override
  final String username;

  @override
  String toString() {
    return 'RegisterEvent.usernameChanged(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterUsernameChanged &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(username);

  @override
  $RegisterUsernameChangedCopyWith<RegisterUsernameChanged> get copyWith =>
      _$RegisterUsernameChangedCopyWithImpl<RegisterUsernameChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result usernameChanged(String username),
    @required Result passwordChanged(String password),
    @required
        Result regiserWithCredentials(
            String email, String password, String username),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return usernameChanged(username);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result usernameChanged(String username),
    Result passwordChanged(String password),
    Result regiserWithCredentials(
        String email, String password, String username),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(RegisterEmailChanged value),
    @required Result usernameChanged(RegisterUsernameChanged value),
    @required Result passwordChanged(RegisterPasswordChanged value),
    @required Result regiserWithCredentials(RegisterSubmitted value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(RegisterEmailChanged value),
    Result usernameChanged(RegisterUsernameChanged value),
    Result passwordChanged(RegisterPasswordChanged value),
    Result regiserWithCredentials(RegisterSubmitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class RegisterUsernameChanged implements RegisterEvent {
  const factory RegisterUsernameChanged({@required String username}) =
      _$RegisterUsernameChanged;

  String get username;
  $RegisterUsernameChangedCopyWith<RegisterUsernameChanged> get copyWith;
}

/// @nodoc
abstract class $RegisterPasswordChangedCopyWith<$Res> {
  factory $RegisterPasswordChangedCopyWith(RegisterPasswordChanged value,
          $Res Function(RegisterPasswordChanged) then) =
      _$RegisterPasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$RegisterPasswordChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterPasswordChangedCopyWith<$Res> {
  _$RegisterPasswordChangedCopyWithImpl(RegisterPasswordChanged _value,
      $Res Function(RegisterPasswordChanged) _then)
      : super(_value, (v) => _then(v as RegisterPasswordChanged));

  @override
  RegisterPasswordChanged get _value => super._value as RegisterPasswordChanged;

  @override
  $Res call({
    Object password = freezed,
  }) {
    return _then(RegisterPasswordChanged(
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$RegisterPasswordChanged implements RegisterPasswordChanged {
  const _$RegisterPasswordChanged({@required this.password})
      : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterPasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  $RegisterPasswordChangedCopyWith<RegisterPasswordChanged> get copyWith =>
      _$RegisterPasswordChangedCopyWithImpl<RegisterPasswordChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result usernameChanged(String username),
    @required Result passwordChanged(String password),
    @required
        Result regiserWithCredentials(
            String email, String password, String username),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result usernameChanged(String username),
    Result passwordChanged(String password),
    Result regiserWithCredentials(
        String email, String password, String username),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(RegisterEmailChanged value),
    @required Result usernameChanged(RegisterUsernameChanged value),
    @required Result passwordChanged(RegisterPasswordChanged value),
    @required Result regiserWithCredentials(RegisterSubmitted value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(RegisterEmailChanged value),
    Result usernameChanged(RegisterUsernameChanged value),
    Result passwordChanged(RegisterPasswordChanged value),
    Result regiserWithCredentials(RegisterSubmitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class RegisterPasswordChanged implements RegisterEvent {
  const factory RegisterPasswordChanged({@required String password}) =
      _$RegisterPasswordChanged;

  String get password;
  $RegisterPasswordChangedCopyWith<RegisterPasswordChanged> get copyWith;
}

/// @nodoc
abstract class $RegisterSubmittedCopyWith<$Res> {
  factory $RegisterSubmittedCopyWith(
          RegisterSubmitted value, $Res Function(RegisterSubmitted) then) =
      _$RegisterSubmittedCopyWithImpl<$Res>;
  $Res call({String email, String password, String username});
}

/// @nodoc
class _$RegisterSubmittedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterSubmittedCopyWith<$Res> {
  _$RegisterSubmittedCopyWithImpl(
      RegisterSubmitted _value, $Res Function(RegisterSubmitted) _then)
      : super(_value, (v) => _then(v as RegisterSubmitted));

  @override
  RegisterSubmitted get _value => super._value as RegisterSubmitted;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object username = freezed,
  }) {
    return _then(RegisterSubmitted(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      username: username == freezed ? _value.username : username as String,
    ));
  }
}

/// @nodoc
class _$RegisterSubmitted implements RegisterSubmitted {
  const _$RegisterSubmitted(
      {@required this.email, @required this.password, @required this.username})
      : assert(email != null),
        assert(password != null),
        assert(username != null);

  @override
  final String email;
  @override
  final String password;
  @override
  final String username;

  @override
  String toString() {
    return 'RegisterEvent.regiserWithCredentials(email: $email, password: $password, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterSubmitted &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username);

  @override
  $RegisterSubmittedCopyWith<RegisterSubmitted> get copyWith =>
      _$RegisterSubmittedCopyWithImpl<RegisterSubmitted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result usernameChanged(String username),
    @required Result passwordChanged(String password),
    @required
        Result regiserWithCredentials(
            String email, String password, String username),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return regiserWithCredentials(email, password, username);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result usernameChanged(String username),
    Result passwordChanged(String password),
    Result regiserWithCredentials(
        String email, String password, String username),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (regiserWithCredentials != null) {
      return regiserWithCredentials(email, password, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(RegisterEmailChanged value),
    @required Result usernameChanged(RegisterUsernameChanged value),
    @required Result passwordChanged(RegisterPasswordChanged value),
    @required Result regiserWithCredentials(RegisterSubmitted value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(regiserWithCredentials != null);
    return regiserWithCredentials(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(RegisterEmailChanged value),
    Result usernameChanged(RegisterUsernameChanged value),
    Result passwordChanged(RegisterPasswordChanged value),
    Result regiserWithCredentials(RegisterSubmitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (regiserWithCredentials != null) {
      return regiserWithCredentials(this);
    }
    return orElse();
  }
}

abstract class RegisterSubmitted implements RegisterEvent {
  const factory RegisterSubmitted(
      {@required String email,
      @required String password,
      @required String username}) = _$RegisterSubmitted;

  String get email;
  String get password;
  String get username;
  $RegisterSubmittedCopyWith<RegisterSubmitted> get copyWith;
}
