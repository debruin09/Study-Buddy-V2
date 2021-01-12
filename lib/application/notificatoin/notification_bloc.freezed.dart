// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationEventTearOff {
  const _$NotificationEventTearOff();

// ignore: unused_element
  _Initialize initialize() {
    return const _Initialize();
  }

// ignore: unused_element
  _InstantNotification instantNotification() {
    return const _InstantNotification();
  }

// ignore: unused_element
  _EasyNotifier easyNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) {
    return _EasyNotifier(
      deck: deck,
      cards: cards,
    );
  }

// ignore: unused_element
  _ModerateNotfier moderateNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) {
    return _ModerateNotfier(
      deck: deck,
      cards: cards,
    );
  }

// ignore: unused_element
  _HardNotifier hardNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) {
    return _HardNotifier(
      deck: deck,
      cards: cards,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationEvent = _$NotificationEventTearOff();

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialize(),
    @required TResult instantNotification(),
    @required TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required
        TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialize(),
    TResult instantNotification(),
    TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialize(_Initialize value),
    @required TResult instantNotification(_InstantNotification value),
    @required TResult easyNotifier(_EasyNotifier value),
    @required TResult moderateNotifier(_ModerateNotfier value),
    @required TResult hardNotifier(_HardNotifier value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialize(_Initialize value),
    TResult instantNotification(_InstantNotification value),
    TResult easyNotifier(_EasyNotifier value),
    TResult moderateNotifier(_ModerateNotfier value),
    TResult hardNotifier(_HardNotifier value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  final NotificationEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationEvent) _then;
}

/// @nodoc
abstract class _$InitializeCopyWith<$Res> {
  factory _$InitializeCopyWith(
          _Initialize value, $Res Function(_Initialize) then) =
      __$InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializeCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$InitializeCopyWith<$Res> {
  __$InitializeCopyWithImpl(
      _Initialize _value, $Res Function(_Initialize) _then)
      : super(_value, (v) => _then(v as _Initialize));

  @override
  _Initialize get _value => super._value as _Initialize;
}

/// @nodoc
class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'NotificationEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialize(),
    @required TResult instantNotification(),
    @required TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required
        TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialize(),
    TResult instantNotification(),
    TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialize(_Initialize value),
    @required TResult instantNotification(_InstantNotification value),
    @required TResult easyNotifier(_EasyNotifier value),
    @required TResult moderateNotifier(_ModerateNotfier value),
    @required TResult hardNotifier(_HardNotifier value),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialize(_Initialize value),
    TResult instantNotification(_InstantNotification value),
    TResult easyNotifier(_EasyNotifier value),
    TResult moderateNotifier(_ModerateNotfier value),
    TResult hardNotifier(_HardNotifier value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements NotificationEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$InstantNotificationCopyWith<$Res> {
  factory _$InstantNotificationCopyWith(_InstantNotification value,
          $Res Function(_InstantNotification) then) =
      __$InstantNotificationCopyWithImpl<$Res>;
}

/// @nodoc
class __$InstantNotificationCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$InstantNotificationCopyWith<$Res> {
  __$InstantNotificationCopyWithImpl(
      _InstantNotification _value, $Res Function(_InstantNotification) _then)
      : super(_value, (v) => _then(v as _InstantNotification));

  @override
  _InstantNotification get _value => super._value as _InstantNotification;
}

/// @nodoc
class _$_InstantNotification implements _InstantNotification {
  const _$_InstantNotification();

  @override
  String toString() {
    return 'NotificationEvent.instantNotification()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InstantNotification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialize(),
    @required TResult instantNotification(),
    @required TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required
        TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return instantNotification();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialize(),
    TResult instantNotification(),
    TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (instantNotification != null) {
      return instantNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialize(_Initialize value),
    @required TResult instantNotification(_InstantNotification value),
    @required TResult easyNotifier(_EasyNotifier value),
    @required TResult moderateNotifier(_ModerateNotfier value),
    @required TResult hardNotifier(_HardNotifier value),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return instantNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialize(_Initialize value),
    TResult instantNotification(_InstantNotification value),
    TResult easyNotifier(_EasyNotifier value),
    TResult moderateNotifier(_ModerateNotfier value),
    TResult hardNotifier(_HardNotifier value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (instantNotification != null) {
      return instantNotification(this);
    }
    return orElse();
  }
}

abstract class _InstantNotification implements NotificationEvent {
  const factory _InstantNotification() = _$_InstantNotification;
}

/// @nodoc
abstract class _$EasyNotifierCopyWith<$Res> {
  factory _$EasyNotifierCopyWith(
          _EasyNotifier value, $Res Function(_EasyNotifier) then) =
      __$EasyNotifierCopyWithImpl<$Res>;
  $Res call({Deck deck, KtList<CardItemPrimitive> cards});

  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$EasyNotifierCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$EasyNotifierCopyWith<$Res> {
  __$EasyNotifierCopyWithImpl(
      _EasyNotifier _value, $Res Function(_EasyNotifier) _then)
      : super(_value, (v) => _then(v as _EasyNotifier));

  @override
  _EasyNotifier get _value => super._value as _EasyNotifier;

  @override
  $Res call({
    Object deck = freezed,
    Object cards = freezed,
  }) {
    return _then(_EasyNotifier(
      deck: deck == freezed ? _value.deck : deck as Deck,
      cards:
          cards == freezed ? _value.cards : cards as KtList<CardItemPrimitive>,
    ));
  }

  @override
  $DeckCopyWith<$Res> get deck {
    if (_value.deck == null) {
      return null;
    }
    return $DeckCopyWith<$Res>(_value.deck, (value) {
      return _then(_value.copyWith(deck: value));
    });
  }
}

/// @nodoc
class _$_EasyNotifier implements _EasyNotifier {
  const _$_EasyNotifier({@required this.deck, this.cards})
      : assert(deck != null);

  @override
  final Deck deck;
  @override
  final KtList<CardItemPrimitive> cards;

  @override
  String toString() {
    return 'NotificationEvent.easyNotifier(deck: $deck, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EasyNotifier &&
            (identical(other.deck, deck) ||
                const DeepCollectionEquality().equals(other.deck, deck)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deck) ^
      const DeepCollectionEquality().hash(cards);

  @override
  _$EasyNotifierCopyWith<_EasyNotifier> get copyWith =>
      __$EasyNotifierCopyWithImpl<_EasyNotifier>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialize(),
    @required TResult instantNotification(),
    @required TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required
        TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return easyNotifier(deck, cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialize(),
    TResult instantNotification(),
    TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (easyNotifier != null) {
      return easyNotifier(deck, cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialize(_Initialize value),
    @required TResult instantNotification(_InstantNotification value),
    @required TResult easyNotifier(_EasyNotifier value),
    @required TResult moderateNotifier(_ModerateNotfier value),
    @required TResult hardNotifier(_HardNotifier value),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return easyNotifier(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialize(_Initialize value),
    TResult instantNotification(_InstantNotification value),
    TResult easyNotifier(_EasyNotifier value),
    TResult moderateNotifier(_ModerateNotfier value),
    TResult hardNotifier(_HardNotifier value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (easyNotifier != null) {
      return easyNotifier(this);
    }
    return orElse();
  }
}

abstract class _EasyNotifier implements NotificationEvent {
  const factory _EasyNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) = _$_EasyNotifier;

  Deck get deck;
  KtList<CardItemPrimitive> get cards;
  _$EasyNotifierCopyWith<_EasyNotifier> get copyWith;
}

/// @nodoc
abstract class _$ModerateNotfierCopyWith<$Res> {
  factory _$ModerateNotfierCopyWith(
          _ModerateNotfier value, $Res Function(_ModerateNotfier) then) =
      __$ModerateNotfierCopyWithImpl<$Res>;
  $Res call({Deck deck, KtList<CardItemPrimitive> cards});

  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$ModerateNotfierCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$ModerateNotfierCopyWith<$Res> {
  __$ModerateNotfierCopyWithImpl(
      _ModerateNotfier _value, $Res Function(_ModerateNotfier) _then)
      : super(_value, (v) => _then(v as _ModerateNotfier));

  @override
  _ModerateNotfier get _value => super._value as _ModerateNotfier;

  @override
  $Res call({
    Object deck = freezed,
    Object cards = freezed,
  }) {
    return _then(_ModerateNotfier(
      deck: deck == freezed ? _value.deck : deck as Deck,
      cards:
          cards == freezed ? _value.cards : cards as KtList<CardItemPrimitive>,
    ));
  }

  @override
  $DeckCopyWith<$Res> get deck {
    if (_value.deck == null) {
      return null;
    }
    return $DeckCopyWith<$Res>(_value.deck, (value) {
      return _then(_value.copyWith(deck: value));
    });
  }
}

/// @nodoc
class _$_ModerateNotfier implements _ModerateNotfier {
  const _$_ModerateNotfier({@required this.deck, this.cards})
      : assert(deck != null);

  @override
  final Deck deck;
  @override
  final KtList<CardItemPrimitive> cards;

  @override
  String toString() {
    return 'NotificationEvent.moderateNotifier(deck: $deck, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ModerateNotfier &&
            (identical(other.deck, deck) ||
                const DeepCollectionEquality().equals(other.deck, deck)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deck) ^
      const DeepCollectionEquality().hash(cards);

  @override
  _$ModerateNotfierCopyWith<_ModerateNotfier> get copyWith =>
      __$ModerateNotfierCopyWithImpl<_ModerateNotfier>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialize(),
    @required TResult instantNotification(),
    @required TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required
        TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return moderateNotifier(deck, cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialize(),
    TResult instantNotification(),
    TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moderateNotifier != null) {
      return moderateNotifier(deck, cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialize(_Initialize value),
    @required TResult instantNotification(_InstantNotification value),
    @required TResult easyNotifier(_EasyNotifier value),
    @required TResult moderateNotifier(_ModerateNotfier value),
    @required TResult hardNotifier(_HardNotifier value),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return moderateNotifier(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialize(_Initialize value),
    TResult instantNotification(_InstantNotification value),
    TResult easyNotifier(_EasyNotifier value),
    TResult moderateNotifier(_ModerateNotfier value),
    TResult hardNotifier(_HardNotifier value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moderateNotifier != null) {
      return moderateNotifier(this);
    }
    return orElse();
  }
}

abstract class _ModerateNotfier implements NotificationEvent {
  const factory _ModerateNotfier(
      {@required Deck deck,
      KtList<CardItemPrimitive> cards}) = _$_ModerateNotfier;

  Deck get deck;
  KtList<CardItemPrimitive> get cards;
  _$ModerateNotfierCopyWith<_ModerateNotfier> get copyWith;
}

/// @nodoc
abstract class _$HardNotifierCopyWith<$Res> {
  factory _$HardNotifierCopyWith(
          _HardNotifier value, $Res Function(_HardNotifier) then) =
      __$HardNotifierCopyWithImpl<$Res>;
  $Res call({Deck deck, KtList<CardItemPrimitive> cards});

  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$HardNotifierCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$HardNotifierCopyWith<$Res> {
  __$HardNotifierCopyWithImpl(
      _HardNotifier _value, $Res Function(_HardNotifier) _then)
      : super(_value, (v) => _then(v as _HardNotifier));

  @override
  _HardNotifier get _value => super._value as _HardNotifier;

  @override
  $Res call({
    Object deck = freezed,
    Object cards = freezed,
  }) {
    return _then(_HardNotifier(
      deck: deck == freezed ? _value.deck : deck as Deck,
      cards:
          cards == freezed ? _value.cards : cards as KtList<CardItemPrimitive>,
    ));
  }

  @override
  $DeckCopyWith<$Res> get deck {
    if (_value.deck == null) {
      return null;
    }
    return $DeckCopyWith<$Res>(_value.deck, (value) {
      return _then(_value.copyWith(deck: value));
    });
  }
}

/// @nodoc
class _$_HardNotifier implements _HardNotifier {
  const _$_HardNotifier({@required this.deck, this.cards})
      : assert(deck != null);

  @override
  final Deck deck;
  @override
  final KtList<CardItemPrimitive> cards;

  @override
  String toString() {
    return 'NotificationEvent.hardNotifier(deck: $deck, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HardNotifier &&
            (identical(other.deck, deck) ||
                const DeepCollectionEquality().equals(other.deck, deck)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deck) ^
      const DeepCollectionEquality().hash(cards);

  @override
  _$HardNotifierCopyWith<_HardNotifier> get copyWith =>
      __$HardNotifierCopyWithImpl<_HardNotifier>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialize(),
    @required TResult instantNotification(),
    @required TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required
        TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return hardNotifier(deck, cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialize(),
    TResult instantNotification(),
    TResult easyNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult moderateNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    TResult hardNotifier(Deck deck, KtList<CardItemPrimitive> cards),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (hardNotifier != null) {
      return hardNotifier(deck, cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialize(_Initialize value),
    @required TResult instantNotification(_InstantNotification value),
    @required TResult easyNotifier(_EasyNotifier value),
    @required TResult moderateNotifier(_ModerateNotfier value),
    @required TResult hardNotifier(_HardNotifier value),
  }) {
    assert(initialize != null);
    assert(instantNotification != null);
    assert(easyNotifier != null);
    assert(moderateNotifier != null);
    assert(hardNotifier != null);
    return hardNotifier(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialize(_Initialize value),
    TResult instantNotification(_InstantNotification value),
    TResult easyNotifier(_EasyNotifier value),
    TResult moderateNotifier(_ModerateNotfier value),
    TResult hardNotifier(_HardNotifier value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (hardNotifier != null) {
      return hardNotifier(this);
    }
    return orElse();
  }
}

abstract class _HardNotifier implements NotificationEvent {
  const factory _HardNotifier(
      {@required Deck deck, KtList<CardItemPrimitive> cards}) = _$_HardNotifier;

  Deck get deck;
  KtList<CardItemPrimitive> get cards;
  _$HardNotifierCopyWith<_HardNotifier> get copyWith;
}

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _NotificationSuccess success() {
    return const _NotificationSuccess();
  }

// ignore: unused_element
  _NotificationFailure failure(NotificationFailure notificationFailure) {
    return _NotificationFailure(
      notificationFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult success(),
    @required TResult failure(NotificationFailure notificationFailure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult success(),
    TResult failure(NotificationFailure notificationFailure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult success(_NotificationSuccess value),
    @required TResult failure(_NotificationFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult success(_NotificationSuccess value),
    TResult failure(_NotificationFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  final NotificationState _value;
  // ignore: unused_field
  final $Res Function(NotificationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$NotificationStateCopyWithImpl<$Res>
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
    return 'NotificationState.initial()';
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
    @required TResult success(),
    @required TResult failure(NotificationFailure notificationFailure),
  }) {
    assert(initial != null);
    assert(success != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult success(),
    TResult failure(NotificationFailure notificationFailure),
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
    @required TResult success(_NotificationSuccess value),
    @required TResult failure(_NotificationFailure value),
  }) {
    assert(initial != null);
    assert(success != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult success(_NotificationSuccess value),
    TResult failure(_NotificationFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$NotificationSuccessCopyWith<$Res> {
  factory _$NotificationSuccessCopyWith(_NotificationSuccess value,
          $Res Function(_NotificationSuccess) then) =
      __$NotificationSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotificationSuccessCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationSuccessCopyWith<$Res> {
  __$NotificationSuccessCopyWithImpl(
      _NotificationSuccess _value, $Res Function(_NotificationSuccess) _then)
      : super(_value, (v) => _then(v as _NotificationSuccess));

  @override
  _NotificationSuccess get _value => super._value as _NotificationSuccess;
}

/// @nodoc
class _$_NotificationSuccess implements _NotificationSuccess {
  const _$_NotificationSuccess();

  @override
  String toString() {
    return 'NotificationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NotificationSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult success(),
    @required TResult failure(NotificationFailure notificationFailure),
  }) {
    assert(initial != null);
    assert(success != null);
    assert(failure != null);
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult success(),
    TResult failure(NotificationFailure notificationFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult success(_NotificationSuccess value),
    @required TResult failure(_NotificationFailure value),
  }) {
    assert(initial != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult success(_NotificationSuccess value),
    TResult failure(_NotificationFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _NotificationSuccess implements NotificationState {
  const factory _NotificationSuccess() = _$_NotificationSuccess;
}

/// @nodoc
abstract class _$NotificationFailureCopyWith<$Res> {
  factory _$NotificationFailureCopyWith(_NotificationFailure value,
          $Res Function(_NotificationFailure) then) =
      __$NotificationFailureCopyWithImpl<$Res>;
  $Res call({NotificationFailure notificationFailure});

  $NotificationFailureCopyWith<$Res> get notificationFailure;
}

/// @nodoc
class __$NotificationFailureCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationFailureCopyWith<$Res> {
  __$NotificationFailureCopyWithImpl(
      _NotificationFailure _value, $Res Function(_NotificationFailure) _then)
      : super(_value, (v) => _then(v as _NotificationFailure));

  @override
  _NotificationFailure get _value => super._value as _NotificationFailure;

  @override
  $Res call({
    Object notificationFailure = freezed,
  }) {
    return _then(_NotificationFailure(
      notificationFailure == freezed
          ? _value.notificationFailure
          : notificationFailure as NotificationFailure,
    ));
  }

  @override
  $NotificationFailureCopyWith<$Res> get notificationFailure {
    if (_value.notificationFailure == null) {
      return null;
    }
    return $NotificationFailureCopyWith<$Res>(_value.notificationFailure,
        (value) {
      return _then(_value.copyWith(notificationFailure: value));
    });
  }
}

/// @nodoc
class _$_NotificationFailure implements _NotificationFailure {
  const _$_NotificationFailure(this.notificationFailure)
      : assert(notificationFailure != null);

  @override
  final NotificationFailure notificationFailure;

  @override
  String toString() {
    return 'NotificationState.failure(notificationFailure: $notificationFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationFailure &&
            (identical(other.notificationFailure, notificationFailure) ||
                const DeepCollectionEquality()
                    .equals(other.notificationFailure, notificationFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notificationFailure);

  @override
  _$NotificationFailureCopyWith<_NotificationFailure> get copyWith =>
      __$NotificationFailureCopyWithImpl<_NotificationFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult success(),
    @required TResult failure(NotificationFailure notificationFailure),
  }) {
    assert(initial != null);
    assert(success != null);
    assert(failure != null);
    return failure(notificationFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult success(),
    TResult failure(NotificationFailure notificationFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(notificationFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult success(_NotificationSuccess value),
    @required TResult failure(_NotificationFailure value),
  }) {
    assert(initial != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult success(_NotificationSuccess value),
    TResult failure(_NotificationFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _NotificationFailure implements NotificationState {
  const factory _NotificationFailure(NotificationFailure notificationFailure) =
      _$_NotificationFailure;

  NotificationFailure get notificationFailure;
  _$NotificationFailureCopyWith<_NotificationFailure> get copyWith;
}
