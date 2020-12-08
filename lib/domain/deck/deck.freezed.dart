// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DeckTearOff {
  const _$DeckTearOff();

// ignore: unused_element
  _Deck call(
      {@required UniqueId id,
      @required DeckName name,
      @required HardCard hardCard,
      @required ModerateCard moderateCard,
      @required EasyCard easyCard,
      @required List6<CardItem> cards}) {
    return _Deck(
      id: id,
      name: name,
      hardCard: hardCard,
      moderateCard: moderateCard,
      easyCard: easyCard,
      cards: cards,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Deck = _$DeckTearOff();

/// @nodoc
mixin _$Deck {
  UniqueId get id;
  DeckName get name;
  HardCard get hardCard;
  ModerateCard get moderateCard;
  EasyCard get easyCard;
  List6<CardItem> get cards;

  $DeckCopyWith<Deck> get copyWith;
}

/// @nodoc
abstract class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) then) =
      _$DeckCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      DeckName name,
      HardCard hardCard,
      ModerateCard moderateCard,
      EasyCard easyCard,
      List6<CardItem> cards});
}

/// @nodoc
class _$DeckCopyWithImpl<$Res> implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._value, this._then);

  final Deck _value;
  // ignore: unused_field
  final $Res Function(Deck) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object hardCard = freezed,
    Object moderateCard = freezed,
    Object easyCard = freezed,
    Object cards = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as DeckName,
      hardCard: hardCard == freezed ? _value.hardCard : hardCard as HardCard,
      moderateCard: moderateCard == freezed
          ? _value.moderateCard
          : moderateCard as ModerateCard,
      easyCard: easyCard == freezed ? _value.easyCard : easyCard as EasyCard,
      cards: cards == freezed ? _value.cards : cards as List6<CardItem>,
    ));
  }
}

/// @nodoc
abstract class _$DeckCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$DeckCopyWith(_Deck value, $Res Function(_Deck) then) =
      __$DeckCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      DeckName name,
      HardCard hardCard,
      ModerateCard moderateCard,
      EasyCard easyCard,
      List6<CardItem> cards});
}

/// @nodoc
class __$DeckCopyWithImpl<$Res> extends _$DeckCopyWithImpl<$Res>
    implements _$DeckCopyWith<$Res> {
  __$DeckCopyWithImpl(_Deck _value, $Res Function(_Deck) _then)
      : super(_value, (v) => _then(v as _Deck));

  @override
  _Deck get _value => super._value as _Deck;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object hardCard = freezed,
    Object moderateCard = freezed,
    Object easyCard = freezed,
    Object cards = freezed,
  }) {
    return _then(_Deck(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as DeckName,
      hardCard: hardCard == freezed ? _value.hardCard : hardCard as HardCard,
      moderateCard: moderateCard == freezed
          ? _value.moderateCard
          : moderateCard as ModerateCard,
      easyCard: easyCard == freezed ? _value.easyCard : easyCard as EasyCard,
      cards: cards == freezed ? _value.cards : cards as List6<CardItem>,
    ));
  }
}

/// @nodoc
class _$_Deck extends _Deck {
  const _$_Deck(
      {@required this.id,
      @required this.name,
      @required this.hardCard,
      @required this.moderateCard,
      @required this.easyCard,
      @required this.cards})
      : assert(id != null),
        assert(name != null),
        assert(hardCard != null),
        assert(moderateCard != null),
        assert(easyCard != null),
        assert(cards != null),
        super._();

  @override
  final UniqueId id;
  @override
  final DeckName name;
  @override
  final HardCard hardCard;
  @override
  final ModerateCard moderateCard;
  @override
  final EasyCard easyCard;
  @override
  final List6<CardItem> cards;

  @override
  String toString() {
    return 'Deck(id: $id, name: $name, hardCard: $hardCard, moderateCard: $moderateCard, easyCard: $easyCard, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Deck &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.hardCard, hardCard) ||
                const DeepCollectionEquality()
                    .equals(other.hardCard, hardCard)) &&
            (identical(other.moderateCard, moderateCard) ||
                const DeepCollectionEquality()
                    .equals(other.moderateCard, moderateCard)) &&
            (identical(other.easyCard, easyCard) ||
                const DeepCollectionEquality()
                    .equals(other.easyCard, easyCard)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(hardCard) ^
      const DeepCollectionEquality().hash(moderateCard) ^
      const DeepCollectionEquality().hash(easyCard) ^
      const DeepCollectionEquality().hash(cards);

  @override
  _$DeckCopyWith<_Deck> get copyWith =>
      __$DeckCopyWithImpl<_Deck>(this, _$identity);
}

abstract class _Deck extends Deck {
  const _Deck._() : super._();
  const factory _Deck(
      {@required UniqueId id,
      @required DeckName name,
      @required HardCard hardCard,
      @required ModerateCard moderateCard,
      @required EasyCard easyCard,
      @required List6<CardItem> cards}) = _$_Deck;

  @override
  UniqueId get id;
  @override
  DeckName get name;
  @override
  HardCard get hardCard;
  @override
  ModerateCard get moderateCard;
  @override
  EasyCard get easyCard;
  @override
  List6<CardItem> get cards;
  @override
  _$DeckCopyWith<_Deck> get copyWith;
}
