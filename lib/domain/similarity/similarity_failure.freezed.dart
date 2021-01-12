// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'similarity_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SimilarityFailureTearOff {
  const _$SimilarityFailureTearOff();

// ignore: unused_element
  _UnexpectedFailure unexpected({@required String failedMessage}) {
    return _UnexpectedFailure(
      failedMessage: failedMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SimilarityFailure = _$SimilarityFailureTearOff();

/// @nodoc
mixin _$SimilarityFailure {
  String get failedMessage;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult unexpected(String failedMessage),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult unexpected(String failedMessage),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult unexpected(_UnexpectedFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult unexpected(_UnexpectedFailure value),
    @required TResult orElse(),
  });

  $SimilarityFailureCopyWith<SimilarityFailure> get copyWith;
}

/// @nodoc
abstract class $SimilarityFailureCopyWith<$Res> {
  factory $SimilarityFailureCopyWith(
          SimilarityFailure value, $Res Function(SimilarityFailure) then) =
      _$SimilarityFailureCopyWithImpl<$Res>;
  $Res call({String failedMessage});
}

/// @nodoc
class _$SimilarityFailureCopyWithImpl<$Res>
    implements $SimilarityFailureCopyWith<$Res> {
  _$SimilarityFailureCopyWithImpl(this._value, this._then);

  final SimilarityFailure _value;
  // ignore: unused_field
  final $Res Function(SimilarityFailure) _then;

  @override
  $Res call({
    Object failedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      failedMessage: failedMessage == freezed
          ? _value.failedMessage
          : failedMessage as String,
    ));
  }
}

/// @nodoc
abstract class _$UnexpectedFailureCopyWith<$Res>
    implements $SimilarityFailureCopyWith<$Res> {
  factory _$UnexpectedFailureCopyWith(
          _UnexpectedFailure value, $Res Function(_UnexpectedFailure) then) =
      __$UnexpectedFailureCopyWithImpl<$Res>;
  @override
  $Res call({String failedMessage});
}

/// @nodoc
class __$UnexpectedFailureCopyWithImpl<$Res>
    extends _$SimilarityFailureCopyWithImpl<$Res>
    implements _$UnexpectedFailureCopyWith<$Res> {
  __$UnexpectedFailureCopyWithImpl(
      _UnexpectedFailure _value, $Res Function(_UnexpectedFailure) _then)
      : super(_value, (v) => _then(v as _UnexpectedFailure));

  @override
  _UnexpectedFailure get _value => super._value as _UnexpectedFailure;

  @override
  $Res call({
    Object failedMessage = freezed,
  }) {
    return _then(_UnexpectedFailure(
      failedMessage: failedMessage == freezed
          ? _value.failedMessage
          : failedMessage as String,
    ));
  }
}

/// @nodoc
class _$_UnexpectedFailure
    with DiagnosticableTreeMixin
    implements _UnexpectedFailure {
  const _$_UnexpectedFailure({@required this.failedMessage})
      : assert(failedMessage != null);

  @override
  final String failedMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SimilarityFailure.unexpected(failedMessage: $failedMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SimilarityFailure.unexpected'))
      ..add(DiagnosticsProperty('failedMessage', failedMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnexpectedFailure &&
            (identical(other.failedMessage, failedMessage) ||
                const DeepCollectionEquality()
                    .equals(other.failedMessage, failedMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedMessage);

  @override
  _$UnexpectedFailureCopyWith<_UnexpectedFailure> get copyWith =>
      __$UnexpectedFailureCopyWithImpl<_UnexpectedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult unexpected(String failedMessage),
  }) {
    assert(unexpected != null);
    return unexpected(failedMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult unexpected(String failedMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(failedMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult unexpected(_UnexpectedFailure value),
  }) {
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult unexpected(_UnexpectedFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _UnexpectedFailure implements SimilarityFailure {
  const factory _UnexpectedFailure({@required String failedMessage}) =
      _$_UnexpectedFailure;

  @override
  String get failedMessage;
  @override
  _$UnexpectedFailureCopyWith<_UnexpectedFailure> get copyWith;
}
