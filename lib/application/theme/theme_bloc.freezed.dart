// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

// ignore: unused_element
  _ThemeChanged changed({@required AppTheme appTheme}) {
    return _ThemeChanged(
      appTheme: appTheme,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ThemeEvent = _$ThemeEventTearOff();

/// @nodoc
mixin _$ThemeEvent {
  AppTheme get appTheme;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changed(AppTheme appTheme),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changed(AppTheme appTheme),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changed(_ThemeChanged value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changed(_ThemeChanged value),
    @required TResult orElse(),
  });

  $ThemeEventCopyWith<ThemeEvent> get copyWith;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
  $Res call({AppTheme appTheme});
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;

  @override
  $Res call({
    Object appTheme = freezed,
  }) {
    return _then(_value.copyWith(
      appTheme: appTheme == freezed ? _value.appTheme : appTheme as AppTheme,
    ));
  }
}

/// @nodoc
abstract class _$ThemeChangedCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory _$ThemeChangedCopyWith(
          _ThemeChanged value, $Res Function(_ThemeChanged) then) =
      __$ThemeChangedCopyWithImpl<$Res>;
  @override
  $Res call({AppTheme appTheme});
}

/// @nodoc
class __$ThemeChangedCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements _$ThemeChangedCopyWith<$Res> {
  __$ThemeChangedCopyWithImpl(
      _ThemeChanged _value, $Res Function(_ThemeChanged) _then)
      : super(_value, (v) => _then(v as _ThemeChanged));

  @override
  _ThemeChanged get _value => super._value as _ThemeChanged;

  @override
  $Res call({
    Object appTheme = freezed,
  }) {
    return _then(_ThemeChanged(
      appTheme: appTheme == freezed ? _value.appTheme : appTheme as AppTheme,
    ));
  }
}

/// @nodoc
class _$_ThemeChanged implements _ThemeChanged {
  const _$_ThemeChanged({@required this.appTheme}) : assert(appTheme != null);

  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'ThemeEvent.changed(appTheme: $appTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeChanged &&
            (identical(other.appTheme, appTheme) ||
                const DeepCollectionEquality()
                    .equals(other.appTheme, appTheme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(appTheme);

  @override
  _$ThemeChangedCopyWith<_ThemeChanged> get copyWith =>
      __$ThemeChangedCopyWithImpl<_ThemeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changed(AppTheme appTheme),
  }) {
    assert(changed != null);
    return changed(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changed(AppTheme appTheme),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changed != null) {
      return changed(appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changed(_ThemeChanged value),
  }) {
    assert(changed != null);
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changed(_ThemeChanged value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _ThemeChanged implements ThemeEvent {
  const factory _ThemeChanged({@required AppTheme appTheme}) = _$_ThemeChanged;

  @override
  AppTheme get appTheme;
  @override
  _$ThemeChangedCopyWith<_ThemeChanged> get copyWith;
}

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

// ignore: unused_element
  _Initial initial({@required ThemeData themeData}) {
    return _Initial(
      themeData: themeData,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  ThemeData get themeData;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(ThemeData themeData),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(ThemeData themeData),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  });

  $ThemeStateCopyWith<ThemeState> get copyWith;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeData themeData});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object themeData = freezed,
  }) {
    return _then(_value.copyWith(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({ThemeData themeData});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object themeData = freezed,
  }) {
    return _then(_Initial(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial({@required this.themeData}) : assert(themeData != null);

  @override
  final ThemeData themeData;

  @override
  String toString() {
    return 'ThemeState.initial(themeData: $themeData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.themeData, themeData) ||
                const DeepCollectionEquality()
                    .equals(other.themeData, themeData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(themeData);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(ThemeData themeData),
  }) {
    assert(initial != null);
    return initial(themeData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(ThemeData themeData),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(themeData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  }) {
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ThemeState {
  const factory _Initial({@required ThemeData themeData}) = _$_Initial;

  @override
  ThemeData get themeData;
  @override
  _$InitialCopyWith<_Initial> get copyWith;
}
