// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DeckDto _$DeckDtoFromJson(Map<String, dynamic> json) {
  return _DeckDto.fromJson(json);
}

/// @nodoc
class _$DeckDtoTearOff {
  const _$DeckDtoTearOff();

// ignore: unused_element
  _DeckDto call(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required int easyCard,
      @required int moderateCard,
      @required int hardCard,
      @required List<CardItemDto> cards,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp}) {
    return _DeckDto(
      id: id,
      name: name,
      easyCard: easyCard,
      moderateCard: moderateCard,
      hardCard: hardCard,
      cards: cards,
      serverTimeStamp: serverTimeStamp,
    );
  }

// ignore: unused_element
  DeckDto fromJson(Map<String, Object> json) {
    return DeckDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DeckDto = _$DeckDtoTearOff();

/// @nodoc
mixin _$DeckDto {
  @JsonKey(ignore: true)
  String get id;
  String get name;
  int get easyCard;
  int get moderateCard;
  int get hardCard;
  List<CardItemDto> get cards;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;

  Map<String, dynamic> toJson();
  $DeckDtoCopyWith<DeckDto> get copyWith;
}

/// @nodoc
abstract class $DeckDtoCopyWith<$Res> {
  factory $DeckDtoCopyWith(DeckDto value, $Res Function(DeckDto) then) =
      _$DeckDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      int easyCard,
      int moderateCard,
      int hardCard,
      List<CardItemDto> cards,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$DeckDtoCopyWithImpl<$Res> implements $DeckDtoCopyWith<$Res> {
  _$DeckDtoCopyWithImpl(this._value, this._then);

  final DeckDto _value;
  // ignore: unused_field
  final $Res Function(DeckDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object easyCard = freezed,
    Object moderateCard = freezed,
    Object hardCard = freezed,
    Object cards = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      easyCard: easyCard == freezed ? _value.easyCard : easyCard as int,
      moderateCard:
          moderateCard == freezed ? _value.moderateCard : moderateCard as int,
      hardCard: hardCard == freezed ? _value.hardCard : hardCard as int,
      cards: cards == freezed ? _value.cards : cards as List<CardItemDto>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$DeckDtoCopyWith<$Res> implements $DeckDtoCopyWith<$Res> {
  factory _$DeckDtoCopyWith(_DeckDto value, $Res Function(_DeckDto) then) =
      __$DeckDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      int easyCard,
      int moderateCard,
      int hardCard,
      List<CardItemDto> cards,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$DeckDtoCopyWithImpl<$Res> extends _$DeckDtoCopyWithImpl<$Res>
    implements _$DeckDtoCopyWith<$Res> {
  __$DeckDtoCopyWithImpl(_DeckDto _value, $Res Function(_DeckDto) _then)
      : super(_value, (v) => _then(v as _DeckDto));

  @override
  _DeckDto get _value => super._value as _DeckDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object easyCard = freezed,
    Object moderateCard = freezed,
    Object hardCard = freezed,
    Object cards = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_DeckDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      easyCard: easyCard == freezed ? _value.easyCard : easyCard as int,
      moderateCard:
          moderateCard == freezed ? _value.moderateCard : moderateCard as int,
      hardCard: hardCard == freezed ? _value.hardCard : hardCard as int,
      cards: cards == freezed ? _value.cards : cards as List<CardItemDto>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DeckDto extends _DeckDto {
  const _$_DeckDto(
      {@JsonKey(ignore: true) this.id,
      @required this.name,
      @required this.easyCard,
      @required this.moderateCard,
      @required this.hardCard,
      @required this.cards,
      @required @ServerTimestampConverter() this.serverTimeStamp})
      : assert(name != null),
        assert(easyCard != null),
        assert(moderateCard != null),
        assert(hardCard != null),
        assert(cards != null),
        assert(serverTimeStamp != null),
        super._();

  factory _$_DeckDto.fromJson(Map<String, dynamic> json) =>
      _$_$_DeckDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
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
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'DeckDto(id: $id, name: $name, easyCard: $easyCard, moderateCard: $moderateCard, hardCard: $hardCard, cards: $cards, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeckDto &&
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
                const DeepCollectionEquality().equals(other.cards, cards)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(easyCard) ^
      const DeepCollectionEquality().hash(moderateCard) ^
      const DeepCollectionEquality().hash(hardCard) ^
      const DeepCollectionEquality().hash(cards) ^
      const DeepCollectionEquality().hash(serverTimeStamp);

  @override
  _$DeckDtoCopyWith<_DeckDto> get copyWith =>
      __$DeckDtoCopyWithImpl<_DeckDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeckDtoToJson(this);
  }
}

abstract class _DeckDto extends DeckDto {
  const _DeckDto._() : super._();
  const factory _DeckDto(
          {@JsonKey(ignore: true) String id,
          @required String name,
          @required int easyCard,
          @required int moderateCard,
          @required int hardCard,
          @required List<CardItemDto> cards,
          @required @ServerTimestampConverter() FieldValue serverTimeStamp}) =
      _$_DeckDto;

  factory _DeckDto.fromJson(Map<String, dynamic> json) = _$_DeckDto.fromJson;

  @override
  @JsonKey(ignore: true)
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
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  _$DeckDtoCopyWith<_DeckDto> get copyWith;
}

CardItemDto _$CardItemDtoFromJson(Map<String, dynamic> json) {
  return _CardItemDto.fromJson(json);
}

/// @nodoc
class _$CardItemDtoTearOff {
  const _$CardItemDtoTearOff();

// ignore: unused_element
  _CardItemDto call(
      {@required String id,
      @required String front,
      @required String back,
      @required String me,
      @required bool studied,
      @required int color}) {
    return _CardItemDto(
      id: id,
      front: front,
      back: back,
      me: me,
      studied: studied,
      color: color,
    );
  }

// ignore: unused_element
  CardItemDto fromJson(Map<String, Object> json) {
    return CardItemDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CardItemDto = _$CardItemDtoTearOff();

/// @nodoc
mixin _$CardItemDto {
  String get id;
  String get front;
  String get back;
  String get me;
  bool get studied;
  int get color;

  Map<String, dynamic> toJson();
  $CardItemDtoCopyWith<CardItemDto> get copyWith;
}

/// @nodoc
abstract class $CardItemDtoCopyWith<$Res> {
  factory $CardItemDtoCopyWith(
          CardItemDto value, $Res Function(CardItemDto) then) =
      _$CardItemDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String front,
      String back,
      String me,
      bool studied,
      int color});
}

/// @nodoc
class _$CardItemDtoCopyWithImpl<$Res> implements $CardItemDtoCopyWith<$Res> {
  _$CardItemDtoCopyWithImpl(this._value, this._then);

  final CardItemDto _value;
  // ignore: unused_field
  final $Res Function(CardItemDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object front = freezed,
    Object back = freezed,
    Object me = freezed,
    Object studied = freezed,
    Object color = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      front: front == freezed ? _value.front : front as String,
      back: back == freezed ? _value.back : back as String,
      me: me == freezed ? _value.me : me as String,
      studied: studied == freezed ? _value.studied : studied as bool,
      color: color == freezed ? _value.color : color as int,
    ));
  }
}

/// @nodoc
abstract class _$CardItemDtoCopyWith<$Res>
    implements $CardItemDtoCopyWith<$Res> {
  factory _$CardItemDtoCopyWith(
          _CardItemDto value, $Res Function(_CardItemDto) then) =
      __$CardItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String front,
      String back,
      String me,
      bool studied,
      int color});
}

/// @nodoc
class __$CardItemDtoCopyWithImpl<$Res> extends _$CardItemDtoCopyWithImpl<$Res>
    implements _$CardItemDtoCopyWith<$Res> {
  __$CardItemDtoCopyWithImpl(
      _CardItemDto _value, $Res Function(_CardItemDto) _then)
      : super(_value, (v) => _then(v as _CardItemDto));

  @override
  _CardItemDto get _value => super._value as _CardItemDto;

  @override
  $Res call({
    Object id = freezed,
    Object front = freezed,
    Object back = freezed,
    Object me = freezed,
    Object studied = freezed,
    Object color = freezed,
  }) {
    return _then(_CardItemDto(
      id: id == freezed ? _value.id : id as String,
      front: front == freezed ? _value.front : front as String,
      back: back == freezed ? _value.back : back as String,
      me: me == freezed ? _value.me : me as String,
      studied: studied == freezed ? _value.studied : studied as bool,
      color: color == freezed ? _value.color : color as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CardItemDto extends _CardItemDto {
  const _$_CardItemDto(
      {@required this.id,
      @required this.front,
      @required this.back,
      @required this.me,
      @required this.studied,
      @required this.color})
      : assert(id != null),
        assert(front != null),
        assert(back != null),
        assert(me != null),
        assert(studied != null),
        assert(color != null),
        super._();

  factory _$_CardItemDto.fromJson(Map<String, dynamic> json) =>
      _$_$_CardItemDtoFromJson(json);

  @override
  final String id;
  @override
  final String front;
  @override
  final String back;
  @override
  final String me;
  @override
  final bool studied;
  @override
  final int color;

  @override
  String toString() {
    return 'CardItemDto(id: $id, front: $front, back: $back, me: $me, studied: $studied, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardItemDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.front, front) ||
                const DeepCollectionEquality().equals(other.front, front)) &&
            (identical(other.back, back) ||
                const DeepCollectionEquality().equals(other.back, back)) &&
            (identical(other.me, me) ||
                const DeepCollectionEquality().equals(other.me, me)) &&
            (identical(other.studied, studied) ||
                const DeepCollectionEquality()
                    .equals(other.studied, studied)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(front) ^
      const DeepCollectionEquality().hash(back) ^
      const DeepCollectionEquality().hash(me) ^
      const DeepCollectionEquality().hash(studied) ^
      const DeepCollectionEquality().hash(color);

  @override
  _$CardItemDtoCopyWith<_CardItemDto> get copyWith =>
      __$CardItemDtoCopyWithImpl<_CardItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CardItemDtoToJson(this);
  }
}

abstract class _CardItemDto extends CardItemDto {
  const _CardItemDto._() : super._();
  const factory _CardItemDto(
      {@required String id,
      @required String front,
      @required String back,
      @required String me,
      @required bool studied,
      @required int color}) = _$_CardItemDto;

  factory _CardItemDto.fromJson(Map<String, dynamic> json) =
      _$_CardItemDto.fromJson;

  @override
  String get id;
  @override
  String get front;
  @override
  String get back;
  @override
  String get me;
  @override
  bool get studied;
  @override
  int get color;
  @override
  _$CardItemDtoCopyWith<_CardItemDto> get copyWith;
}
