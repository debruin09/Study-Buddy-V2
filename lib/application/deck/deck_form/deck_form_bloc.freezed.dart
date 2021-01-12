// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DeckFormEventTearOff {
  const _$DeckFormEventTearOff();

// ignore: unused_element
  _Initialized initialized(Option<Deck> initialDeckOption) {
    return _Initialized(
      initialDeckOption,
    );
  }

// ignore: unused_element
  _NameChanged nameChanged(String nameStr) {
    return _NameChanged(
      nameStr,
    );
  }

// ignore: unused_element
  _CardsChanged cardsChanged(KtList<CardItemPrimitive> cards) {
    return _CardsChanged(
      cards,
    );
  }

// ignore: unused_element
  _EasyCardChange easyCardChange() {
    return const _EasyCardChange();
  }

// ignore: unused_element
  _ModerateCardChange moderateCardChange() {
    return const _ModerateCardChange();
  }

// ignore: unused_element
  _HardCardChange hardCardChange() {
    return const _HardCardChange();
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $DeckFormEvent = _$DeckFormEventTearOff();

/// @nodoc
mixin _$DeckFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $DeckFormEventCopyWith<$Res> {
  factory $DeckFormEventCopyWith(
          DeckFormEvent value, $Res Function(DeckFormEvent) then) =
      _$DeckFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckFormEventCopyWithImpl<$Res>
    implements $DeckFormEventCopyWith<$Res> {
  _$DeckFormEventCopyWithImpl(this._value, this._then);

  final DeckFormEvent _value;
  // ignore: unused_field
  final $Res Function(DeckFormEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Deck> initialDeckOption});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object initialDeckOption = freezed,
  }) {
    return _then(_Initialized(
      initialDeckOption == freezed
          ? _value.initialDeckOption
          : initialDeckOption as Option<Deck>,
    ));
  }
}

/// @nodoc
class _$_Initialized implements _Initialized {
  const _$_Initialized(this.initialDeckOption)
      : assert(initialDeckOption != null);

  @override
  final Option<Deck> initialDeckOption;

  @override
  String toString() {
    return 'DeckFormEvent.initialized(initialDeckOption: $initialDeckOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.initialDeckOption, initialDeckOption) ||
                const DeepCollectionEquality()
                    .equals(other.initialDeckOption, initialDeckOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialDeckOption);

  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return initialized(initialDeckOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(initialDeckOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements DeckFormEvent {
  const factory _Initialized(Option<Deck> initialDeckOption) = _$_Initialized;

  Option<Deck> get initialDeckOption;
  _$InitializedCopyWith<_Initialized> get copyWith;
}

/// @nodoc
abstract class _$NameChangedCopyWith<$Res> {
  factory _$NameChangedCopyWith(
          _NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String nameStr});
}

/// @nodoc
class __$NameChangedCopyWithImpl<$Res> extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(
      _NameChanged _value, $Res Function(_NameChanged) _then)
      : super(_value, (v) => _then(v as _NameChanged));

  @override
  _NameChanged get _value => super._value as _NameChanged;

  @override
  $Res call({
    Object nameStr = freezed,
  }) {
    return _then(_NameChanged(
      nameStr == freezed ? _value.nameStr : nameStr as String,
    ));
  }
}

/// @nodoc
class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.nameStr) : assert(nameStr != null);

  @override
  final String nameStr;

  @override
  String toString() {
    return 'DeckFormEvent.nameChanged(nameStr: $nameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NameChanged &&
            (identical(other.nameStr, nameStr) ||
                const DeepCollectionEquality().equals(other.nameStr, nameStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(nameStr);

  @override
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(nameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements DeckFormEvent {
  const factory _NameChanged(String nameStr) = _$_NameChanged;

  String get nameStr;
  _$NameChangedCopyWith<_NameChanged> get copyWith;
}

/// @nodoc
abstract class _$CardsChangedCopyWith<$Res> {
  factory _$CardsChangedCopyWith(
          _CardsChanged value, $Res Function(_CardsChanged) then) =
      __$CardsChangedCopyWithImpl<$Res>;
  $Res call({KtList<CardItemPrimitive> cards});
}

/// @nodoc
class __$CardsChangedCopyWithImpl<$Res>
    extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$CardsChangedCopyWith<$Res> {
  __$CardsChangedCopyWithImpl(
      _CardsChanged _value, $Res Function(_CardsChanged) _then)
      : super(_value, (v) => _then(v as _CardsChanged));

  @override
  _CardsChanged get _value => super._value as _CardsChanged;

  @override
  $Res call({
    Object cards = freezed,
  }) {
    return _then(_CardsChanged(
      cards == freezed ? _value.cards : cards as KtList<CardItemPrimitive>,
    ));
  }
}

/// @nodoc
class _$_CardsChanged implements _CardsChanged {
  const _$_CardsChanged(this.cards) : assert(cards != null);

  @override
  final KtList<CardItemPrimitive> cards;

  @override
  String toString() {
    return 'DeckFormEvent.cardsChanged(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardsChanged &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cards);

  @override
  _$CardsChangedCopyWith<_CardsChanged> get copyWith =>
      __$CardsChangedCopyWithImpl<_CardsChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return cardsChanged(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cardsChanged != null) {
      return cardsChanged(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return cardsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cardsChanged != null) {
      return cardsChanged(this);
    }
    return orElse();
  }
}

abstract class _CardsChanged implements DeckFormEvent {
  const factory _CardsChanged(KtList<CardItemPrimitive> cards) =
      _$_CardsChanged;

  KtList<CardItemPrimitive> get cards;
  _$CardsChangedCopyWith<_CardsChanged> get copyWith;
}

/// @nodoc
abstract class _$EasyCardChangeCopyWith<$Res> {
  factory _$EasyCardChangeCopyWith(
          _EasyCardChange value, $Res Function(_EasyCardChange) then) =
      __$EasyCardChangeCopyWithImpl<$Res>;
}

/// @nodoc
class __$EasyCardChangeCopyWithImpl<$Res>
    extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$EasyCardChangeCopyWith<$Res> {
  __$EasyCardChangeCopyWithImpl(
      _EasyCardChange _value, $Res Function(_EasyCardChange) _then)
      : super(_value, (v) => _then(v as _EasyCardChange));

  @override
  _EasyCardChange get _value => super._value as _EasyCardChange;
}

/// @nodoc
class _$_EasyCardChange implements _EasyCardChange {
  const _$_EasyCardChange();

  @override
  String toString() {
    return 'DeckFormEvent.easyCardChange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EasyCardChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return easyCardChange();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (easyCardChange != null) {
      return easyCardChange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return easyCardChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (easyCardChange != null) {
      return easyCardChange(this);
    }
    return orElse();
  }
}

abstract class _EasyCardChange implements DeckFormEvent {
  const factory _EasyCardChange() = _$_EasyCardChange;
}

/// @nodoc
abstract class _$ModerateCardChangeCopyWith<$Res> {
  factory _$ModerateCardChangeCopyWith(
          _ModerateCardChange value, $Res Function(_ModerateCardChange) then) =
      __$ModerateCardChangeCopyWithImpl<$Res>;
}

/// @nodoc
class __$ModerateCardChangeCopyWithImpl<$Res>
    extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$ModerateCardChangeCopyWith<$Res> {
  __$ModerateCardChangeCopyWithImpl(
      _ModerateCardChange _value, $Res Function(_ModerateCardChange) _then)
      : super(_value, (v) => _then(v as _ModerateCardChange));

  @override
  _ModerateCardChange get _value => super._value as _ModerateCardChange;
}

/// @nodoc
class _$_ModerateCardChange implements _ModerateCardChange {
  const _$_ModerateCardChange();

  @override
  String toString() {
    return 'DeckFormEvent.moderateCardChange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ModerateCardChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return moderateCardChange();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moderateCardChange != null) {
      return moderateCardChange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return moderateCardChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (moderateCardChange != null) {
      return moderateCardChange(this);
    }
    return orElse();
  }
}

abstract class _ModerateCardChange implements DeckFormEvent {
  const factory _ModerateCardChange() = _$_ModerateCardChange;
}

/// @nodoc
abstract class _$HardCardChangeCopyWith<$Res> {
  factory _$HardCardChangeCopyWith(
          _HardCardChange value, $Res Function(_HardCardChange) then) =
      __$HardCardChangeCopyWithImpl<$Res>;
}

/// @nodoc
class __$HardCardChangeCopyWithImpl<$Res>
    extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$HardCardChangeCopyWith<$Res> {
  __$HardCardChangeCopyWithImpl(
      _HardCardChange _value, $Res Function(_HardCardChange) _then)
      : super(_value, (v) => _then(v as _HardCardChange));

  @override
  _HardCardChange get _value => super._value as _HardCardChange;
}

/// @nodoc
class _$_HardCardChange implements _HardCardChange {
  const _$_HardCardChange();

  @override
  String toString() {
    return 'DeckFormEvent.hardCardChange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _HardCardChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return hardCardChange();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (hardCardChange != null) {
      return hardCardChange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return hardCardChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (hardCardChange != null) {
      return hardCardChange(this);
    }
    return orElse();
  }
}

abstract class _HardCardChange implements DeckFormEvent {
  const factory _HardCardChange() = _$_HardCardChange;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$DeckFormEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc
class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'DeckFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Deck> initialDeckOption),
    @required TResult nameChanged(String nameStr),
    @required TResult cardsChanged(KtList<CardItemPrimitive> cards),
    @required TResult easyCardChange(),
    @required TResult moderateCardChange(),
    @required TResult hardCardChange(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Deck> initialDeckOption),
    TResult nameChanged(String nameStr),
    TResult cardsChanged(KtList<CardItemPrimitive> cards),
    TResult easyCardChange(),
    TResult moderateCardChange(),
    TResult hardCardChange(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult cardsChanged(_CardsChanged value),
    @required TResult easyCardChange(_EasyCardChange value),
    @required TResult moderateCardChange(_ModerateCardChange value),
    @required TResult hardCardChange(_HardCardChange value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(cardsChanged != null);
    assert(easyCardChange != null);
    assert(moderateCardChange != null);
    assert(hardCardChange != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult cardsChanged(_CardsChanged value),
    TResult easyCardChange(_EasyCardChange value),
    TResult moderateCardChange(_ModerateCardChange value),
    TResult hardCardChange(_HardCardChange value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements DeckFormEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$DeckFormStateTearOff {
  const _$DeckFormStateTearOff();

// ignore: unused_element
  _DeckFormState call(
      {@required Deck deck,
      @required bool showErrorMessages,
      @required bool isEditing,
      @required bool isSaving,
      @required Option<Either<DeckFailure, Unit>> saveFailureOrSuccessOption}) {
    return _DeckFormState(
      deck: deck,
      showErrorMessages: showErrorMessages,
      isEditing: isEditing,
      isSaving: isSaving,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DeckFormState = _$DeckFormStateTearOff();

/// @nodoc
mixin _$DeckFormState {
  Deck get deck;
  bool get showErrorMessages;
  bool get isEditing;
  bool get isSaving;
  Option<Either<DeckFailure, Unit>> get saveFailureOrSuccessOption;

  $DeckFormStateCopyWith<DeckFormState> get copyWith;
}

/// @nodoc
abstract class $DeckFormStateCopyWith<$Res> {
  factory $DeckFormStateCopyWith(
          DeckFormState value, $Res Function(DeckFormState) then) =
      _$DeckFormStateCopyWithImpl<$Res>;
  $Res call(
      {Deck deck,
      bool showErrorMessages,
      bool isEditing,
      bool isSaving,
      Option<Either<DeckFailure, Unit>> saveFailureOrSuccessOption});

  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class _$DeckFormStateCopyWithImpl<$Res>
    implements $DeckFormStateCopyWith<$Res> {
  _$DeckFormStateCopyWithImpl(this._value, this._then);

  final DeckFormState _value;
  // ignore: unused_field
  final $Res Function(DeckFormState) _then;

  @override
  $Res call({
    Object deck = freezed,
    Object showErrorMessages = freezed,
    Object isEditing = freezed,
    Object isSaving = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      deck: deck == freezed ? _value.deck : deck as Deck,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<DeckFailure, Unit>>,
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
abstract class _$DeckFormStateCopyWith<$Res>
    implements $DeckFormStateCopyWith<$Res> {
  factory _$DeckFormStateCopyWith(
          _DeckFormState value, $Res Function(_DeckFormState) then) =
      __$DeckFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Deck deck,
      bool showErrorMessages,
      bool isEditing,
      bool isSaving,
      Option<Either<DeckFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$DeckFormStateCopyWithImpl<$Res>
    extends _$DeckFormStateCopyWithImpl<$Res>
    implements _$DeckFormStateCopyWith<$Res> {
  __$DeckFormStateCopyWithImpl(
      _DeckFormState _value, $Res Function(_DeckFormState) _then)
      : super(_value, (v) => _then(v as _DeckFormState));

  @override
  _DeckFormState get _value => super._value as _DeckFormState;

  @override
  $Res call({
    Object deck = freezed,
    Object showErrorMessages = freezed,
    Object isEditing = freezed,
    Object isSaving = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_DeckFormState(
      deck: deck == freezed ? _value.deck : deck as Deck,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<DeckFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_DeckFormState implements _DeckFormState {
  const _$_DeckFormState(
      {@required this.deck,
      @required this.showErrorMessages,
      @required this.isEditing,
      @required this.isSaving,
      @required this.saveFailureOrSuccessOption})
      : assert(deck != null),
        assert(showErrorMessages != null),
        assert(isEditing != null),
        assert(isSaving != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final Deck deck;
  @override
  final bool showErrorMessages;
  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<DeckFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'DeckFormState(deck: $deck, showErrorMessages: $showErrorMessages, isEditing: $isEditing, isSaving: $isSaving, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeckFormState &&
            (identical(other.deck, deck) ||
                const DeepCollectionEquality().equals(other.deck, deck)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deck) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @override
  _$DeckFormStateCopyWith<_DeckFormState> get copyWith =>
      __$DeckFormStateCopyWithImpl<_DeckFormState>(this, _$identity);
}

abstract class _DeckFormState implements DeckFormState {
  const factory _DeckFormState(
          {@required
              Deck deck,
          @required
              bool showErrorMessages,
          @required
              bool isEditing,
          @required
              bool isSaving,
          @required
              Option<Either<DeckFailure, Unit>> saveFailureOrSuccessOption}) =
      _$_DeckFormState;

  @override
  Deck get deck;
  @override
  bool get showErrorMessages;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<DeckFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  _$DeckFormStateCopyWith<_DeckFormState> get copyWith;
}
