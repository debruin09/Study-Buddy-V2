// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'speech_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SpeechEventTearOff {
  const _$SpeechEventTearOff();

// ignore: unused_element
  _OnChange onChange({@required String text}) {
    return _OnChange(
      text: text,
    );
  }

// ignore: unused_element
  _SpeechEventError error({@required String errorMessage}) {
    return _SpeechEventError(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SpeechEvent = _$SpeechEventTearOff();

/// @nodoc
mixin _$SpeechEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult onChange(String text),
    @required TResult error(String errorMessage),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onChange(String text),
    TResult error(String errorMessage),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onChange(_OnChange value),
    @required TResult error(_SpeechEventError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onChange(_OnChange value),
    TResult error(_SpeechEventError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SpeechEventCopyWith<$Res> {
  factory $SpeechEventCopyWith(
          SpeechEvent value, $Res Function(SpeechEvent) then) =
      _$SpeechEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeechEventCopyWithImpl<$Res> implements $SpeechEventCopyWith<$Res> {
  _$SpeechEventCopyWithImpl(this._value, this._then);

  final SpeechEvent _value;
  // ignore: unused_field
  final $Res Function(SpeechEvent) _then;
}

/// @nodoc
abstract class _$OnChangeCopyWith<$Res> {
  factory _$OnChangeCopyWith(_OnChange value, $Res Function(_OnChange) then) =
      __$OnChangeCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$OnChangeCopyWithImpl<$Res> extends _$SpeechEventCopyWithImpl<$Res>
    implements _$OnChangeCopyWith<$Res> {
  __$OnChangeCopyWithImpl(_OnChange _value, $Res Function(_OnChange) _then)
      : super(_value, (v) => _then(v as _OnChange));

  @override
  _OnChange get _value => super._value as _OnChange;

  @override
  $Res call({
    Object text = freezed,
  }) {
    return _then(_OnChange(
      text: text == freezed ? _value.text : text as String,
    ));
  }
}

/// @nodoc
class _$_OnChange implements _OnChange {
  const _$_OnChange({@required this.text}) : assert(text != null);

  @override
  final String text;

  @override
  String toString() {
    return 'SpeechEvent.onChange(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnChange &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @override
  _$OnChangeCopyWith<_OnChange> get copyWith =>
      __$OnChangeCopyWithImpl<_OnChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult onChange(String text),
    @required TResult error(String errorMessage),
  }) {
    assert(onChange != null);
    assert(error != null);
    return onChange(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onChange(String text),
    TResult error(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onChange != null) {
      return onChange(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onChange(_OnChange value),
    @required TResult error(_SpeechEventError value),
  }) {
    assert(onChange != null);
    assert(error != null);
    return onChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onChange(_OnChange value),
    TResult error(_SpeechEventError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onChange != null) {
      return onChange(this);
    }
    return orElse();
  }
}

abstract class _OnChange implements SpeechEvent {
  const factory _OnChange({@required String text}) = _$_OnChange;

  String get text;
  _$OnChangeCopyWith<_OnChange> get copyWith;
}

/// @nodoc
abstract class _$SpeechEventErrorCopyWith<$Res> {
  factory _$SpeechEventErrorCopyWith(
          _SpeechEventError value, $Res Function(_SpeechEventError) then) =
      __$SpeechEventErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$SpeechEventErrorCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res>
    implements _$SpeechEventErrorCopyWith<$Res> {
  __$SpeechEventErrorCopyWithImpl(
      _SpeechEventError _value, $Res Function(_SpeechEventError) _then)
      : super(_value, (v) => _then(v as _SpeechEventError));

  @override
  _SpeechEventError get _value => super._value as _SpeechEventError;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(_SpeechEventError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_SpeechEventError implements _SpeechEventError {
  const _$_SpeechEventError({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SpeechEvent.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpeechEventError &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  _$SpeechEventErrorCopyWith<_SpeechEventError> get copyWith =>
      __$SpeechEventErrorCopyWithImpl<_SpeechEventError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult onChange(String text),
    @required TResult error(String errorMessage),
  }) {
    assert(onChange != null);
    assert(error != null);
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onChange(String text),
    TResult error(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onChange(_OnChange value),
    @required TResult error(_SpeechEventError value),
  }) {
    assert(onChange != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onChange(_OnChange value),
    TResult error(_SpeechEventError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SpeechEventError implements SpeechEvent {
  const factory _SpeechEventError({@required String errorMessage}) =
      _$_SpeechEventError;

  String get errorMessage;
  _$SpeechEventErrorCopyWith<_SpeechEventError> get copyWith;
}

/// @nodoc
class _$SpeechStateTearOff {
  const _$SpeechStateTearOff();

// ignore: unused_element
  _Initial initial({@required SpeechEntity speechEntity}) {
    return _Initial(
      speechEntity: speechEntity,
    );
  }

// ignore: unused_element
  _IsListening isListening({@required SpeechEntity speechEntity}) {
    return _IsListening(
      speechEntity: speechEntity,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SpeechState = _$SpeechStateTearOff();

/// @nodoc
mixin _$SpeechState {
  SpeechEntity get speechEntity;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(SpeechEntity speechEntity),
    @required TResult isListening(SpeechEntity speechEntity),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(SpeechEntity speechEntity),
    TResult isListening(SpeechEntity speechEntity),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult isListening(_IsListening value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult isListening(_IsListening value),
    @required TResult orElse(),
  });

  $SpeechStateCopyWith<SpeechState> get copyWith;
}

/// @nodoc
abstract class $SpeechStateCopyWith<$Res> {
  factory $SpeechStateCopyWith(
          SpeechState value, $Res Function(SpeechState) then) =
      _$SpeechStateCopyWithImpl<$Res>;
  $Res call({SpeechEntity speechEntity});
}

/// @nodoc
class _$SpeechStateCopyWithImpl<$Res> implements $SpeechStateCopyWith<$Res> {
  _$SpeechStateCopyWithImpl(this._value, this._then);

  final SpeechState _value;
  // ignore: unused_field
  final $Res Function(SpeechState) _then;

  @override
  $Res call({
    Object speechEntity = freezed,
  }) {
    return _then(_value.copyWith(
      speechEntity: speechEntity == freezed
          ? _value.speechEntity
          : speechEntity as SpeechEntity,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $SpeechStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({SpeechEntity speechEntity});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SpeechStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object speechEntity = freezed,
  }) {
    return _then(_Initial(
      speechEntity: speechEntity == freezed
          ? _value.speechEntity
          : speechEntity as SpeechEntity,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial({@required this.speechEntity})
      : assert(speechEntity != null);

  @override
  final SpeechEntity speechEntity;

  @override
  String toString() {
    return 'SpeechState.initial(speechEntity: $speechEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.speechEntity, speechEntity) ||
                const DeepCollectionEquality()
                    .equals(other.speechEntity, speechEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(speechEntity);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(SpeechEntity speechEntity),
    @required TResult isListening(SpeechEntity speechEntity),
  }) {
    assert(initial != null);
    assert(isListening != null);
    return initial(speechEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(SpeechEntity speechEntity),
    TResult isListening(SpeechEntity speechEntity),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(speechEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult isListening(_IsListening value),
  }) {
    assert(initial != null);
    assert(isListening != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult isListening(_IsListening value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SpeechState {
  const factory _Initial({@required SpeechEntity speechEntity}) = _$_Initial;

  @override
  SpeechEntity get speechEntity;
  @override
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$IsListeningCopyWith<$Res>
    implements $SpeechStateCopyWith<$Res> {
  factory _$IsListeningCopyWith(
          _IsListening value, $Res Function(_IsListening) then) =
      __$IsListeningCopyWithImpl<$Res>;
  @override
  $Res call({SpeechEntity speechEntity});
}

/// @nodoc
class __$IsListeningCopyWithImpl<$Res> extends _$SpeechStateCopyWithImpl<$Res>
    implements _$IsListeningCopyWith<$Res> {
  __$IsListeningCopyWithImpl(
      _IsListening _value, $Res Function(_IsListening) _then)
      : super(_value, (v) => _then(v as _IsListening));

  @override
  _IsListening get _value => super._value as _IsListening;

  @override
  $Res call({
    Object speechEntity = freezed,
  }) {
    return _then(_IsListening(
      speechEntity: speechEntity == freezed
          ? _value.speechEntity
          : speechEntity as SpeechEntity,
    ));
  }
}

/// @nodoc
class _$_IsListening implements _IsListening {
  const _$_IsListening({@required this.speechEntity})
      : assert(speechEntity != null);

  @override
  final SpeechEntity speechEntity;

  @override
  String toString() {
    return 'SpeechState.isListening(speechEntity: $speechEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IsListening &&
            (identical(other.speechEntity, speechEntity) ||
                const DeepCollectionEquality()
                    .equals(other.speechEntity, speechEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(speechEntity);

  @override
  _$IsListeningCopyWith<_IsListening> get copyWith =>
      __$IsListeningCopyWithImpl<_IsListening>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(SpeechEntity speechEntity),
    @required TResult isListening(SpeechEntity speechEntity),
  }) {
    assert(initial != null);
    assert(isListening != null);
    return isListening(speechEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(SpeechEntity speechEntity),
    TResult isListening(SpeechEntity speechEntity),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isListening != null) {
      return isListening(speechEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult isListening(_IsListening value),
  }) {
    assert(initial != null);
    assert(isListening != null);
    return isListening(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult isListening(_IsListening value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isListening != null) {
      return isListening(this);
    }
    return orElse();
  }
}

abstract class _IsListening implements SpeechState {
  const factory _IsListening({@required SpeechEntity speechEntity}) =
      _$_IsListening;

  @override
  SpeechEntity get speechEntity;
  @override
  _$IsListeningCopyWith<_IsListening> get copyWith;
}
