// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DeckWatcherEventTearOff {
  const _$DeckWatcherEventTearOff();

// ignore: unused_element
  _WatchAllStarted watchAllStarted() {
    return const _WatchAllStarted();
  }

// ignore: unused_element
  _WatchUnstudiedStarted watchUnstudiedStarted() {
    return const _WatchUnstudiedStarted();
  }

// ignore: unused_element
  _DecksReceived decksReceived(
      Either<DeckFailure, KtList<Deck>> failureOrDecks) {
    return _DecksReceived(
      failureOrDecks,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DeckWatcherEvent = _$DeckWatcherEventTearOff();

/// @nodoc
mixin _$DeckWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchUnstudiedStarted(),
    @required
        TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchUnstudiedStarted(),
    TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    @required TResult decksReceived(_DecksReceived value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    TResult decksReceived(_DecksReceived value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $DeckWatcherEventCopyWith<$Res> {
  factory $DeckWatcherEventCopyWith(
          DeckWatcherEvent value, $Res Function(DeckWatcherEvent) then) =
      _$DeckWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckWatcherEventCopyWithImpl<$Res>
    implements $DeckWatcherEventCopyWith<$Res> {
  _$DeckWatcherEventCopyWithImpl(this._value, this._then);

  final DeckWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(DeckWatcherEvent) _then;
}

/// @nodoc
abstract class _$WatchAllStartedCopyWith<$Res> {
  factory _$WatchAllStartedCopyWith(
          _WatchAllStarted value, $Res Function(_WatchAllStarted) then) =
      __$WatchAllStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchAllStartedCopyWithImpl<$Res>
    extends _$DeckWatcherEventCopyWithImpl<$Res>
    implements _$WatchAllStartedCopyWith<$Res> {
  __$WatchAllStartedCopyWithImpl(
      _WatchAllStarted _value, $Res Function(_WatchAllStarted) _then)
      : super(_value, (v) => _then(v as _WatchAllStarted));

  @override
  _WatchAllStarted get _value => super._value as _WatchAllStarted;
}

/// @nodoc
class _$_WatchAllStarted implements _WatchAllStarted {
  const _$_WatchAllStarted();

  @override
  String toString() {
    return 'DeckWatcherEvent.watchAllStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchAllStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchUnstudiedStarted(),
    @required
        TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
  }) {
    assert(watchAllStarted != null);
    assert(watchUnstudiedStarted != null);
    assert(decksReceived != null);
    return watchAllStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchUnstudiedStarted(),
    TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStarted != null) {
      return watchAllStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    @required TResult decksReceived(_DecksReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchUnstudiedStarted != null);
    assert(decksReceived != null);
    return watchAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    TResult decksReceived(_DecksReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStarted != null) {
      return watchAllStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStarted implements DeckWatcherEvent {
  const factory _WatchAllStarted() = _$_WatchAllStarted;
}

/// @nodoc
abstract class _$WatchUnstudiedStartedCopyWith<$Res> {
  factory _$WatchUnstudiedStartedCopyWith(_WatchUnstudiedStarted value,
          $Res Function(_WatchUnstudiedStarted) then) =
      __$WatchUnstudiedStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchUnstudiedStartedCopyWithImpl<$Res>
    extends _$DeckWatcherEventCopyWithImpl<$Res>
    implements _$WatchUnstudiedStartedCopyWith<$Res> {
  __$WatchUnstudiedStartedCopyWithImpl(_WatchUnstudiedStarted _value,
      $Res Function(_WatchUnstudiedStarted) _then)
      : super(_value, (v) => _then(v as _WatchUnstudiedStarted));

  @override
  _WatchUnstudiedStarted get _value => super._value as _WatchUnstudiedStarted;
}

/// @nodoc
class _$_WatchUnstudiedStarted implements _WatchUnstudiedStarted {
  const _$_WatchUnstudiedStarted();

  @override
  String toString() {
    return 'DeckWatcherEvent.watchUnstudiedStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchUnstudiedStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchUnstudiedStarted(),
    @required
        TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
  }) {
    assert(watchAllStarted != null);
    assert(watchUnstudiedStarted != null);
    assert(decksReceived != null);
    return watchUnstudiedStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchUnstudiedStarted(),
    TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchUnstudiedStarted != null) {
      return watchUnstudiedStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    @required TResult decksReceived(_DecksReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchUnstudiedStarted != null);
    assert(decksReceived != null);
    return watchUnstudiedStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    TResult decksReceived(_DecksReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchUnstudiedStarted != null) {
      return watchUnstudiedStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchUnstudiedStarted implements DeckWatcherEvent {
  const factory _WatchUnstudiedStarted() = _$_WatchUnstudiedStarted;
}

/// @nodoc
abstract class _$DecksReceivedCopyWith<$Res> {
  factory _$DecksReceivedCopyWith(
          _DecksReceived value, $Res Function(_DecksReceived) then) =
      __$DecksReceivedCopyWithImpl<$Res>;
  $Res call({Either<DeckFailure, KtList<Deck>> failureOrDecks});
}

/// @nodoc
class __$DecksReceivedCopyWithImpl<$Res>
    extends _$DeckWatcherEventCopyWithImpl<$Res>
    implements _$DecksReceivedCopyWith<$Res> {
  __$DecksReceivedCopyWithImpl(
      _DecksReceived _value, $Res Function(_DecksReceived) _then)
      : super(_value, (v) => _then(v as _DecksReceived));

  @override
  _DecksReceived get _value => super._value as _DecksReceived;

  @override
  $Res call({
    Object failureOrDecks = freezed,
  }) {
    return _then(_DecksReceived(
      failureOrDecks == freezed
          ? _value.failureOrDecks
          : failureOrDecks as Either<DeckFailure, KtList<Deck>>,
    ));
  }
}

/// @nodoc
class _$_DecksReceived implements _DecksReceived {
  const _$_DecksReceived(this.failureOrDecks) : assert(failureOrDecks != null);

  @override
  final Either<DeckFailure, KtList<Deck>> failureOrDecks;

  @override
  String toString() {
    return 'DeckWatcherEvent.decksReceived(failureOrDecks: $failureOrDecks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DecksReceived &&
            (identical(other.failureOrDecks, failureOrDecks) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrDecks, failureOrDecks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrDecks);

  @override
  _$DecksReceivedCopyWith<_DecksReceived> get copyWith =>
      __$DecksReceivedCopyWithImpl<_DecksReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchUnstudiedStarted(),
    @required
        TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
  }) {
    assert(watchAllStarted != null);
    assert(watchUnstudiedStarted != null);
    assert(decksReceived != null);
    return decksReceived(failureOrDecks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchUnstudiedStarted(),
    TResult decksReceived(Either<DeckFailure, KtList<Deck>> failureOrDecks),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (decksReceived != null) {
      return decksReceived(failureOrDecks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    @required TResult decksReceived(_DecksReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchUnstudiedStarted != null);
    assert(decksReceived != null);
    return decksReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchUnstudiedStarted(_WatchUnstudiedStarted value),
    TResult decksReceived(_DecksReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (decksReceived != null) {
      return decksReceived(this);
    }
    return orElse();
  }
}

abstract class _DecksReceived implements DeckWatcherEvent {
  const factory _DecksReceived(
      Either<DeckFailure, KtList<Deck>> failureOrDecks) = _$_DecksReceived;

  Either<DeckFailure, KtList<Deck>> get failureOrDecks;
  _$DecksReceivedCopyWith<_DecksReceived> get copyWith;
}

/// @nodoc
class _$DeckWatcherStateTearOff {
  const _$DeckWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(KtList<Deck> decks) {
    return _LoadSuccess(
      decks,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure(DeckFailure deckFailure) {
    return _LoadFailure(
      deckFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DeckWatcherState = _$DeckWatcherStateTearOff();

/// @nodoc
mixin _$DeckWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Deck> decks),
    @required TResult loadFailure(DeckFailure deckFailure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Deck> decks),
    TResult loadFailure(DeckFailure deckFailure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $DeckWatcherStateCopyWith<$Res> {
  factory $DeckWatcherStateCopyWith(
          DeckWatcherState value, $Res Function(DeckWatcherState) then) =
      _$DeckWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckWatcherStateCopyWithImpl<$Res>
    implements $DeckWatcherStateCopyWith<$Res> {
  _$DeckWatcherStateCopyWithImpl(this._value, this._then);

  final DeckWatcherState _value;
  // ignore: unused_field
  final $Res Function(DeckWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$DeckWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'DeckWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Deck> decks),
    @required TResult loadFailure(DeckFailure deckFailure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Deck> decks),
    TResult loadFailure(DeckFailure deckFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DeckWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$DeckWatcherStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc
class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'DeckWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Deck> decks),
    @required TResult loadFailure(DeckFailure deckFailure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Deck> decks),
    TResult loadFailure(DeckFailure deckFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements DeckWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({KtList<Deck> decks});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$DeckWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object decks = freezed,
  }) {
    return _then(_LoadSuccess(
      decks == freezed ? _value.decks : decks as KtList<Deck>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.decks) : assert(decks != null);

  @override
  final KtList<Deck> decks;

  @override
  String toString() {
    return 'DeckWatcherState.loadSuccess(decks: $decks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.decks, decks) ||
                const DeepCollectionEquality().equals(other.decks, decks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(decks);

  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Deck> decks),
    @required TResult loadFailure(DeckFailure deckFailure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(decks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Deck> decks),
    TResult loadFailure(DeckFailure deckFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(decks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements DeckWatcherState {
  const factory _LoadSuccess(KtList<Deck> decks) = _$_LoadSuccess;

  KtList<Deck> get decks;
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({DeckFailure deckFailure});

  $DeckFailureCopyWith<$Res> get deckFailure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$DeckWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object deckFailure = freezed,
  }) {
    return _then(_LoadFailure(
      deckFailure == freezed ? _value.deckFailure : deckFailure as DeckFailure,
    ));
  }

  @override
  $DeckFailureCopyWith<$Res> get deckFailure {
    if (_value.deckFailure == null) {
      return null;
    }
    return $DeckFailureCopyWith<$Res>(_value.deckFailure, (value) {
      return _then(_value.copyWith(deckFailure: value));
    });
  }
}

/// @nodoc
class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.deckFailure) : assert(deckFailure != null);

  @override
  final DeckFailure deckFailure;

  @override
  String toString() {
    return 'DeckWatcherState.loadFailure(deckFailure: $deckFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.deckFailure, deckFailure) ||
                const DeepCollectionEquality()
                    .equals(other.deckFailure, deckFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(deckFailure);

  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Deck> decks),
    @required TResult loadFailure(DeckFailure deckFailure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(deckFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Deck> decks),
    TResult loadFailure(DeckFailure deckFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(deckFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements DeckWatcherState {
  const factory _LoadFailure(DeckFailure deckFailure) = _$_LoadFailure;

  DeckFailure get deckFailure;
  _$LoadFailureCopyWith<_LoadFailure> get copyWith;
}
