// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck_dao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DeckDao _$DeckDaoFromJson(Map<String, dynamic> json) {
  return _DeckDao.fromJson(json);
}

/// @nodoc
class _$DeckDaoTearOff {
  const _$DeckDaoTearOff();

// ignore: unused_element
  _DeckDao call(
      {@required String id,
      @required String name,
      @required int easyCard,
      @required int moderateCard,
      @required int hardCard,
      @required List<CardItemDto> cards}) {
    return _DeckDao(
      id: id,
      name: name,
      easyCard: easyCard,
      moderateCard: moderateCard,
      hardCard: hardCard,
      cards: cards,
    );
  }

// ignore: unused_element
  DeckDao fromJson(Map<String, Object> json) {
    return DeckDao.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DeckDao = _$DeckDaoTearOff();

/// @nodoc
mixin _$DeckDao {
  String get id;
  String get name;
  int get easyCard;
  int get moderateCard;
  int get hardCard;
  List<CardItemDto> get cards;

  Map<String, dynamic> toJson();
  $DeckDaoCopyWith<DeckDao> get copyWith;
}

/// @nodoc
abstract class $DeckDaoCopyWith<$Res> {
  factory $DeckDaoCopyWith(DeckDao value, $Res Function(DeckDao) then) =
      _$DeckDaoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int easyCard,
      int moderateCard,
      int hardCard,
      List<CardItemDto> cards});
}

/// @nodoc
class _$DeckDaoCopyWithImpl<$Res> implements $DeckDaoCopyWith<$Res> {
  _$DeckDaoCopyWithImpl(this._value, this._then);

  final DeckDao _value;
  // ignore: unused_field
  final $Res Function(DeckDao) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object easyCard = freezed,
    Object moderateCard = freezed,
    Object hardCard = freezed,
    Object cards = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      easyCard: easyCard == freezed ? _value.easyCard : easyCard as int,
      moderateCard:
          moderateCard == freezed ? _value.moderateCard : moderateCard as int,
      hardCard: hardCard == freezed ? _value.hardCard : hardCard as int,
      cards: cards == freezed ? _value.cards : cards as List<CardItemDto>,
    ));
  }
}

/// @nodoc
abstract class _$DeckDaoCopyWith<$Res> implements $DeckDaoCopyWith<$Res> {
  factory _$DeckDaoCopyWith(_DeckDao value, $Res Function(_DeckDao) then) =
      __$DeckDaoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int easyCard,
      int moderateCard,
      int hardCard,
      List<CardItemDto> cards});
}

/// @nodoc
class __$DeckDaoCopyWithImpl<$Res> extends _$DeckDaoCopyWithImpl<$Res>
    implements _$DeckDaoCopyWith<$Res> {
  __$DeckDaoCopyWithImpl(_DeckDao _value, $Res Function(_DeckDao) _then)
      : super(_value, (v) => _then(v as _DeckDao));

  @override
  _DeckDao get _value => super._value as _DeckDao;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object easyCard = freezed,
    Object moderateCard = freezed,
    Object hardCard = freezed,
    Object cards = freezed,
  }) {
    return _then(_DeckDao(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      easyCard: easyCard == freezed ? _value.easyCard : easyCard as int,
      moderateCard:
          moderateCard == freezed ? _value.moderateCard : moderateCard as int,
      hardCard: hardCard == freezed ? _value.hardCard : hardCard as int,
      cards: cards == freezed ? _value.cards : cards as List<CardItemDto>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DeckDao extends _DeckDao {
  const _$_DeckDao(
      {@required this.id,
      @required this.name,
      @required this.easyCard,
      @required this.moderateCard,
      @required this.hardCard,
      @required this.cards})
      : assert(id != null),
        assert(name != null),
        assert(easyCard != null),
        assert(moderateCard != null),
        assert(hardCard != null),
        assert(cards != null),
        super._();

  factory _$_DeckDao.fromJson(Map<String, dynamic> json) =>
      _$_$_DeckDaoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int easyCard;
  @override
  final int moderateCard;
  @override
  final int hardCard;
  @override
  final List<CardItemDto> cards;

  @override
  String toString() {
    return 'DeckDao(id: $id, name: $name, easyCard: $easyCard, moderateCard: $moderateCard, hardCard: $hardCard, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeckDao &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.easyCard, easyCard) ||
                const DeepCollectionEquality()
                    .equals(other.easyCard, easyCard)) &&
            (identical(other.moderateCard, moderateCard) ||
                const DeepCollectionEquality()
                    .equals(other.moderateCard, moderateCard)) &&
            (identical(other.hardCard, hardCard) ||
                const DeepCollectionEquality()
                    .equals(other.hardCard, hardCard)) &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(easyCard) ^
      const DeepCollectionEquality().hash(moderateCard) ^
      const DeepCollectionEquality().hash(hardCard) ^
      const DeepCollectionEquality().hash(cards);

  @override
  _$DeckDaoCopyWith<_DeckDao> get copyWith =>
      __$DeckDaoCopyWithImpl<_DeckDao>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeckDaoToJson(this);
  }
}

abstract class _DeckDao extends DeckDao {
  const _DeckDao._() : super._();
  const factory _DeckDao(
      {@required String id,
      @required String name,
      @required int easyCard,
      @required int moderateCard,
      @required int hardCard,
      @required List<CardItemDto> cards}) = _$_DeckDao;

  factory _DeckDao.fromJson(Map<String, dynamic> json) = _$_DeckDao.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get easyCard;
  @override
  int get moderateCard;
  @override
  int get hardCard;
  @override
  List<CardItemDto> get cards;
  @override
  _$DeckDaoCopyWith<_DeckDao> get copyWith;
}
