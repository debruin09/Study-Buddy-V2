// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'similarity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SimilarityStateTearOff {
  const _$SimilarityStateTearOff();

// ignore: unused_element
  _InitialSimilarityState initial() {
    return _InitialSimilarityState();
  }

// ignore: unused_element
  _LoadSimilarityState loading() {
    return _LoadSimilarityState();
  }

// ignore: unused_element
  _SuccessSimilarityState success(
      {@required Either<Failure, Similarity> similarityScore}) {
    return _SuccessSimilarityState(
      similarityScore: similarityScore,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SimilarityState = _$SimilarityStateTearOff();

/// @nodoc
mixin _$SimilarityState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Either<Failure, Similarity> similarityScore),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Either<Failure, Similarity> similarityScore),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_InitialSimilarityState value),
    @required Result loading(_LoadSimilarityState value),
    @required Result success(_SuccessSimilarityState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_InitialSimilarityState value),
    Result loading(_LoadSimilarityState value),
    Result success(_SuccessSimilarityState value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $SimilarityStateCopyWith<$Res> {
  factory $SimilarityStateCopyWith(
          SimilarityState value, $Res Function(SimilarityState) then) =
      _$SimilarityStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SimilarityStateCopyWithImpl<$Res>
    implements $SimilarityStateCopyWith<$Res> {
  _$SimilarityStateCopyWithImpl(this._value, this._then);

  final SimilarityState _value;
  // ignore: unused_field
  final $Res Function(SimilarityState) _then;
}

/// @nodoc
abstract class _$InitialSimilarityStateCopyWith<$Res> {
  factory _$InitialSimilarityStateCopyWith(_InitialSimilarityState value,
          $Res Function(_InitialSimilarityState) then) =
      __$InitialSimilarityStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialSimilarityStateCopyWithImpl<$Res>
    extends _$SimilarityStateCopyWithImpl<$Res>
    implements _$InitialSimilarityStateCopyWith<$Res> {
  __$InitialSimilarityStateCopyWithImpl(_InitialSimilarityState _value,
      $Res Function(_InitialSimilarityState) _then)
      : super(_value, (v) => _then(v as _InitialSimilarityState));

  @override
  _InitialSimilarityState get _value => super._value as _InitialSimilarityState;
}

/// @nodoc
class _$_InitialSimilarityState
    with DiagnosticableTreeMixin
    implements _InitialSimilarityState {
  _$_InitialSimilarityState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SimilarityState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SimilarityState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InitialSimilarityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Either<Failure, Similarity> similarityScore),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Either<Failure, Similarity> similarityScore),
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
    @required Result initial(_InitialSimilarityState value),
    @required Result loading(_LoadSimilarityState value),
    @required Result success(_SuccessSimilarityState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_InitialSimilarityState value),
    Result loading(_LoadSimilarityState value),
    Result success(_SuccessSimilarityState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialSimilarityState implements SimilarityState {
  factory _InitialSimilarityState() = _$_InitialSimilarityState;
}

/// @nodoc
abstract class _$LoadSimilarityStateCopyWith<$Res> {
  factory _$LoadSimilarityStateCopyWith(_LoadSimilarityState value,
          $Res Function(_LoadSimilarityState) then) =
      __$LoadSimilarityStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadSimilarityStateCopyWithImpl<$Res>
    extends _$SimilarityStateCopyWithImpl<$Res>
    implements _$LoadSimilarityStateCopyWith<$Res> {
  __$LoadSimilarityStateCopyWithImpl(
      _LoadSimilarityState _value, $Res Function(_LoadSimilarityState) _then)
      : super(_value, (v) => _then(v as _LoadSimilarityState));

  @override
  _LoadSimilarityState get _value => super._value as _LoadSimilarityState;
}

/// @nodoc
class _$_LoadSimilarityState
    with DiagnosticableTreeMixin
    implements _LoadSimilarityState {
  _$_LoadSimilarityState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SimilarityState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SimilarityState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadSimilarityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Either<Failure, Similarity> similarityScore),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Either<Failure, Similarity> similarityScore),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_InitialSimilarityState value),
    @required Result loading(_LoadSimilarityState value),
    @required Result success(_SuccessSimilarityState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_InitialSimilarityState value),
    Result loading(_LoadSimilarityState value),
    Result success(_SuccessSimilarityState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadSimilarityState implements SimilarityState {
  factory _LoadSimilarityState() = _$_LoadSimilarityState;
}

/// @nodoc
abstract class _$SuccessSimilarityStateCopyWith<$Res> {
  factory _$SuccessSimilarityStateCopyWith(_SuccessSimilarityState value,
          $Res Function(_SuccessSimilarityState) then) =
      __$SuccessSimilarityStateCopyWithImpl<$Res>;
  $Res call({Either<Failure, Similarity> similarityScore});
}

/// @nodoc
class __$SuccessSimilarityStateCopyWithImpl<$Res>
    extends _$SimilarityStateCopyWithImpl<$Res>
    implements _$SuccessSimilarityStateCopyWith<$Res> {
  __$SuccessSimilarityStateCopyWithImpl(_SuccessSimilarityState _value,
      $Res Function(_SuccessSimilarityState) _then)
      : super(_value, (v) => _then(v as _SuccessSimilarityState));

  @override
  _SuccessSimilarityState get _value => super._value as _SuccessSimilarityState;

  @override
  $Res call({
    Object similarityScore = freezed,
  }) {
    return _then(_SuccessSimilarityState(
      similarityScore: similarityScore == freezed
          ? _value.similarityScore
          : similarityScore as Either<Failure, Similarity>,
    ));
  }
}

/// @nodoc
class _$_SuccessSimilarityState
    with DiagnosticableTreeMixin
    implements _SuccessSimilarityState {
  _$_SuccessSimilarityState({@required this.similarityScore})
      : assert(similarityScore != null);

  @override
  final Either<Failure, Similarity> similarityScore;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SimilarityState.success(similarityScore: $similarityScore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SimilarityState.success'))
      ..add(DiagnosticsProperty('similarityScore', similarityScore));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SuccessSimilarityState &&
            (identical(other.similarityScore, similarityScore) ||
                const DeepCollectionEquality()
                    .equals(other.similarityScore, similarityScore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(similarityScore);

  @override
  _$SuccessSimilarityStateCopyWith<_SuccessSimilarityState> get copyWith =>
      __$SuccessSimilarityStateCopyWithImpl<_SuccessSimilarityState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Either<Failure, Similarity> similarityScore),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    return success(similarityScore);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Either<Failure, Similarity> similarityScore),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(similarityScore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_InitialSimilarityState value),
    @required Result loading(_LoadSimilarityState value),
    @required Result success(_SuccessSimilarityState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_InitialSimilarityState value),
    Result loading(_LoadSimilarityState value),
    Result success(_SuccessSimilarityState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessSimilarityState implements SimilarityState {
  factory _SuccessSimilarityState(
          {@required Either<Failure, Similarity> similarityScore}) =
      _$_SuccessSimilarityState;

  Either<Failure, Similarity> get similarityScore;
  _$SuccessSimilarityStateCopyWith<_SuccessSimilarityState> get copyWith;
}
