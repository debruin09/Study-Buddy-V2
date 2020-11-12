// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoginEventTearOff {
  const _$LoginEventTearOff();

// ignore: unused_element
  LoginEmailChange emailChanged({@required String email}) {
    return LoginEmailChange(
      email: email,
    );
  }

// ignore: unused_element
  LoginPasswordChanged passwordChanged({@required String password}) {
    return LoginPasswordChanged(
      password: password,
    );
  }

// ignore: unused_element
  LoginWithCredentialsPressed loginWithCredentials(
      {@required String email, @required String password}) {
    return LoginWithCredentialsPressed(
      email: email,
      password: password,
    );
  }

// ignore: unused_element
  RegisterWithCredentialsPressed registerWithCredentials(
      {@required String email, @required String password}) {
    return RegisterWithCredentialsPressed(
      email: email,
      password: password,
    );
  }

// ignore: unused_element
  SigninWithGoogle signInWithGooglePressed() {
    return const SigninWithGoogle();
  }
}

/// @nodoc
// ignore: unused_element
const $LoginEvent = _$LoginEventTearOff();

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginWithCredentials(String email, String password),
    @required Result registerWithCredentials(String email, String password),
    @required Result signInWithGooglePressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginWithCredentials(String email, String password),
    Result registerWithCredentials(String email, String password),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(LoginEmailChange value),
    @required Result passwordChanged(LoginPasswordChanged value),
    @required Result loginWithCredentials(LoginWithCredentialsPressed value),
    @required
        Result registerWithCredentials(RegisterWithCredentialsPressed value),
    @required Result signInWithGooglePressed(SigninWithGoogle value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(LoginEmailChange value),
    Result passwordChanged(LoginPasswordChanged value),
    Result loginWithCredentials(LoginWithCredentialsPressed value),
    Result registerWithCredentials(RegisterWithCredentialsPressed value),
    Result signInWithGooglePressed(SigninWithGoogle value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  final LoginEvent _value;
  // ignore: unused_field
  final $Res Function(LoginEvent) _then;
}

/// @nodoc
abstract class $LoginEmailChangeCopyWith<$Res> {
  factory $LoginEmailChangeCopyWith(
          LoginEmailChange value, $Res Function(LoginEmailChange) then) =
      _$LoginEmailChangeCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$LoginEmailChangeCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginEmailChangeCopyWith<$Res> {
  _$LoginEmailChangeCopyWithImpl(
      LoginEmailChange _value, $Res Function(LoginEmailChange) _then)
      : super(_value, (v) => _then(v as LoginEmailChange));

  @override
  LoginEmailChange get _value => super._value as LoginEmailChange;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(LoginEmailChange(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$LoginEmailChange implements LoginEmailChange {
  const _$LoginEmailChange({@required this.email}) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginEmailChange &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $LoginEmailChangeCopyWith<LoginEmailChange> get copyWith =>
      _$LoginEmailChangeCopyWithImpl<LoginEmailChange>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginWithCredentials(String email, String password),
    @required Result registerWithCredentials(String email, String password),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginWithCredentials(String email, String password),
    Result registerWithCredentials(String email, String password),
    Result signInWithGooglePressed(),
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
    @required Result emailChanged(LoginEmailChange value),
    @required Result passwordChanged(LoginPasswordChanged value),
    @required Result loginWithCredentials(LoginWithCredentialsPressed value),
    @required
        Result registerWithCredentials(RegisterWithCredentialsPressed value),
    @required Result signInWithGooglePressed(SigninWithGoogle value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(LoginEmailChange value),
    Result passwordChanged(LoginPasswordChanged value),
    Result loginWithCredentials(LoginWithCredentialsPressed value),
    Result registerWithCredentials(RegisterWithCredentialsPressed value),
    Result signInWithGooglePressed(SigninWithGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class LoginEmailChange implements LoginEvent {
  const factory LoginEmailChange({@required String email}) = _$LoginEmailChange;

  String get email;
  $LoginEmailChangeCopyWith<LoginEmailChange> get copyWith;
}

/// @nodoc
abstract class $LoginPasswordChangedCopyWith<$Res> {
  factory $LoginPasswordChangedCopyWith(LoginPasswordChanged value,
          $Res Function(LoginPasswordChanged) then) =
      _$LoginPasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$LoginPasswordChangedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginPasswordChangedCopyWith<$Res> {
  _$LoginPasswordChangedCopyWithImpl(
      LoginPasswordChanged _value, $Res Function(LoginPasswordChanged) _then)
      : super(_value, (v) => _then(v as LoginPasswordChanged));

  @override
  LoginPasswordChanged get _value => super._value as LoginPasswordChanged;

  @override
  $Res call({
    Object password = freezed,
  }) {
    return _then(LoginPasswordChanged(
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$LoginPasswordChanged implements LoginPasswordChanged {
  const _$LoginPasswordChanged({@required this.password})
      : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginPasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  $LoginPasswordChangedCopyWith<LoginPasswordChanged> get copyWith =>
      _$LoginPasswordChangedCopyWithImpl<LoginPasswordChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginWithCredentials(String email, String password),
    @required Result registerWithCredentials(String email, String password),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginWithCredentials(String email, String password),
    Result registerWithCredentials(String email, String password),
    Result signInWithGooglePressed(),
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
    @required Result emailChanged(LoginEmailChange value),
    @required Result passwordChanged(LoginPasswordChanged value),
    @required Result loginWithCredentials(LoginWithCredentialsPressed value),
    @required
        Result registerWithCredentials(RegisterWithCredentialsPressed value),
    @required Result signInWithGooglePressed(SigninWithGoogle value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(LoginEmailChange value),
    Result passwordChanged(LoginPasswordChanged value),
    Result loginWithCredentials(LoginWithCredentialsPressed value),
    Result registerWithCredentials(RegisterWithCredentialsPressed value),
    Result signInWithGooglePressed(SigninWithGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class LoginPasswordChanged implements LoginEvent {
  const factory LoginPasswordChanged({@required String password}) =
      _$LoginPasswordChanged;

  String get password;
  $LoginPasswordChangedCopyWith<LoginPasswordChanged> get copyWith;
}

/// @nodoc
abstract class $LoginWithCredentialsPressedCopyWith<$Res> {
  factory $LoginWithCredentialsPressedCopyWith(
          LoginWithCredentialsPressed value,
          $Res Function(LoginWithCredentialsPressed) then) =
      _$LoginWithCredentialsPressedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginWithCredentialsPressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithCredentialsPressedCopyWith<$Res> {
  _$LoginWithCredentialsPressedCopyWithImpl(LoginWithCredentialsPressed _value,
      $Res Function(LoginWithCredentialsPressed) _then)
      : super(_value, (v) => _then(v as LoginWithCredentialsPressed));

  @override
  LoginWithCredentialsPressed get _value =>
      super._value as LoginWithCredentialsPressed;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(LoginWithCredentialsPressed(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$LoginWithCredentialsPressed implements LoginWithCredentialsPressed {
  const _$LoginWithCredentialsPressed(
      {@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.loginWithCredentials(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginWithCredentialsPressed &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  $LoginWithCredentialsPressedCopyWith<LoginWithCredentialsPressed>
      get copyWith => _$LoginWithCredentialsPressedCopyWithImpl<
          LoginWithCredentialsPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginWithCredentials(String email, String password),
    @required Result registerWithCredentials(String email, String password),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return loginWithCredentials(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginWithCredentials(String email, String password),
    Result registerWithCredentials(String email, String password),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithCredentials != null) {
      return loginWithCredentials(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(LoginEmailChange value),
    @required Result passwordChanged(LoginPasswordChanged value),
    @required Result loginWithCredentials(LoginWithCredentialsPressed value),
    @required
        Result registerWithCredentials(RegisterWithCredentialsPressed value),
    @required Result signInWithGooglePressed(SigninWithGoogle value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return loginWithCredentials(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(LoginEmailChange value),
    Result passwordChanged(LoginPasswordChanged value),
    Result loginWithCredentials(LoginWithCredentialsPressed value),
    Result registerWithCredentials(RegisterWithCredentialsPressed value),
    Result signInWithGooglePressed(SigninWithGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithCredentials != null) {
      return loginWithCredentials(this);
    }
    return orElse();
  }
}

abstract class LoginWithCredentialsPressed implements LoginEvent {
  const factory LoginWithCredentialsPressed(
      {@required String email,
      @required String password}) = _$LoginWithCredentialsPressed;

  String get email;
  String get password;
  $LoginWithCredentialsPressedCopyWith<LoginWithCredentialsPressed>
      get copyWith;
}

/// @nodoc
abstract class $RegisterWithCredentialsPressedCopyWith<$Res> {
  factory $RegisterWithCredentialsPressedCopyWith(
          RegisterWithCredentialsPressed value,
          $Res Function(RegisterWithCredentialsPressed) then) =
      _$RegisterWithCredentialsPressedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$RegisterWithCredentialsPressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $RegisterWithCredentialsPressedCopyWith<$Res> {
  _$RegisterWithCredentialsPressedCopyWithImpl(
      RegisterWithCredentialsPressed _value,
      $Res Function(RegisterWithCredentialsPressed) _then)
      : super(_value, (v) => _then(v as RegisterWithCredentialsPressed));

  @override
  RegisterWithCredentialsPressed get _value =>
      super._value as RegisterWithCredentialsPressed;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(RegisterWithCredentialsPressed(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$RegisterWithCredentialsPressed
    implements RegisterWithCredentialsPressed {
  const _$RegisterWithCredentialsPressed(
      {@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.registerWithCredentials(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterWithCredentialsPressed &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  $RegisterWithCredentialsPressedCopyWith<RegisterWithCredentialsPressed>
      get copyWith => _$RegisterWithCredentialsPressedCopyWithImpl<
          RegisterWithCredentialsPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginWithCredentials(String email, String password),
    @required Result registerWithCredentials(String email, String password),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return registerWithCredentials(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginWithCredentials(String email, String password),
    Result registerWithCredentials(String email, String password),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerWithCredentials != null) {
      return registerWithCredentials(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(LoginEmailChange value),
    @required Result passwordChanged(LoginPasswordChanged value),
    @required Result loginWithCredentials(LoginWithCredentialsPressed value),
    @required
        Result registerWithCredentials(RegisterWithCredentialsPressed value),
    @required Result signInWithGooglePressed(SigninWithGoogle value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return registerWithCredentials(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(LoginEmailChange value),
    Result passwordChanged(LoginPasswordChanged value),
    Result loginWithCredentials(LoginWithCredentialsPressed value),
    Result registerWithCredentials(RegisterWithCredentialsPressed value),
    Result signInWithGooglePressed(SigninWithGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerWithCredentials != null) {
      return registerWithCredentials(this);
    }
    return orElse();
  }
}

abstract class RegisterWithCredentialsPressed implements LoginEvent {
  const factory RegisterWithCredentialsPressed(
      {@required String email,
      @required String password}) = _$RegisterWithCredentialsPressed;

  String get email;
  String get password;
  $RegisterWithCredentialsPressedCopyWith<RegisterWithCredentialsPressed>
      get copyWith;
}

/// @nodoc
abstract class $SigninWithGoogleCopyWith<$Res> {
  factory $SigninWithGoogleCopyWith(
          SigninWithGoogle value, $Res Function(SigninWithGoogle) then) =
      _$SigninWithGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class _$SigninWithGoogleCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $SigninWithGoogleCopyWith<$Res> {
  _$SigninWithGoogleCopyWithImpl(
      SigninWithGoogle _value, $Res Function(SigninWithGoogle) _then)
      : super(_value, (v) => _then(v as SigninWithGoogle));

  @override
  SigninWithGoogle get _value => super._value as SigninWithGoogle;
}

/// @nodoc
class _$SigninWithGoogle implements SigninWithGoogle {
  const _$SigninWithGoogle();

  @override
  String toString() {
    return 'LoginEvent.signInWithGooglePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SigninWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginWithCredentials(String email, String password),
    @required Result registerWithCredentials(String email, String password),
    @required Result signInWithGooglePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return signInWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginWithCredentials(String email, String password),
    Result registerWithCredentials(String email, String password),
    Result signInWithGooglePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(LoginEmailChange value),
    @required Result passwordChanged(LoginPasswordChanged value),
    @required Result loginWithCredentials(LoginWithCredentialsPressed value),
    @required
        Result registerWithCredentials(RegisterWithCredentialsPressed value),
    @required Result signInWithGooglePressed(SigninWithGoogle value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginWithCredentials != null);
    assert(registerWithCredentials != null);
    assert(signInWithGooglePressed != null);
    return signInWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(LoginEmailChange value),
    Result passwordChanged(LoginPasswordChanged value),
    Result loginWithCredentials(LoginWithCredentialsPressed value),
    Result registerWithCredentials(RegisterWithCredentialsPressed value),
    Result signInWithGooglePressed(SigninWithGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class SigninWithGoogle implements LoginEvent {
  const factory SigninWithGoogle() = _$SigninWithGoogle;
}
