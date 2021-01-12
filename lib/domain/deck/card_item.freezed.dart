// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'card_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CardItemTearOff {
  const _$CardItemTearOff();

// ignore: unused_element
  _CardItem call(
      {@required UniqueId id,
      @required CardFront front,
      @required CardBack back,
      @required CardMe me,
      @required bool studied,
      @required Color color,
      @required KtList<String> tags}) {
    return _CardItem(
      id: id,
      front: front,
      back: back,
      me: me,
      studied: studied,
      color: color,
      tags: tags,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CardItem = _$CardItemTearOff();

/// @nodoc
mixin _$CardItem {
  UniqueId get id;
  CardFront get front;
  CardBack get back;
  CardMe get me;
  bool get studied;
  Color get color;
  KtList<String> get tags;

  $CardItemCopyWith<CardItem> get copyWith;
}

/// @nodoc
abstract class $CardItemCopyWith<$Res> {
  factory $CardItemCopyWith(CardItem value, $Res Function(CardItem) then) =
      _$CardItemCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      CardFront front,
      CardBack back,
      CardMe me,
      bool studied,
      Color color,
      KtList<String> tags});
}

/// @nodoc
class _$CardItemCopyWithImpl<$Res> implements $CardItemCopyWith<$Res> {
  _$CardItemCopyWithImpl(this._value, this._then);

  final CardItem _value;
  // ignore: unused_field
  final $Res Function(CardItem) _then;

  @override
  $Res call({
    Object id = freezed,
    Object front = freezed,
    Object back = freezed,
    Object me = freezed,
    Object studied = freezed,
    Object color = freezed,
    Object tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      front: front == freezed ? _value.front : front as CardFront,
      back: back == freezed ? _value.back : back as CardBack,
      me: me == freezed ? _value.me : me as CardMe,
      studied: studied == freezed ? _value.studied : studied as bool,
      color: color == freezed ? _value.color : color as Color,
      tags: tags == freezed ? _value.tags : tags as KtList<String>,
    ));
  }
}

/// @nodoc
abstract class _$CardItemCopyWith<$Res> implements $CardItemCopyWith<$Res> {
  factory _$CardItemCopyWith(_CardItem value, $Res Function(_CardItem) then) =
      __$CardItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      CardFront front,
      CardBack back,
      CardMe me,
      bool studied,
      Color color,
      KtList<String> tags});
}

/// @nodoc
class __$CardItemCopyWithImpl<$Res> extends _$CardItemCopyWithImpl<$Res>
    implements _$CardItemCopyWith<$Res> {
  __$CardItemCopyWithImpl(_CardItem _value, $Res Function(_CardItem) _then)
      : super(_value, (v) => _then(v as _CardItem));

  @override
  _CardItem get _value => super._value as _CardItem;

  @override
  $Res call({
    Object id = freezed,
    Object front = freezed,
    Object back = freezed,
    Object me = freezed,
    Object studied = freezed,
    Object color = freezed,
    Object tags = freezed,
  }) {
    return _then(_CardItem(
      id: id == freezed ? _value.id : id as UniqueId,
      front: front == freezed ? _value.front : front as CardFront,
      back: back == freezed ? _value.back : back as CardBack,
      me: me == freezed ? _value.me : me as CardMe,
      studied: studied == freezed ? _value.studied : studied as bool,
      color: color == freezed ? _value.color : color as Color,
      tags: tags == freezed ? _value.tags : tags as KtList<String>,
    ));
  }
}

/// @nodoc
class _$_CardItem extends _CardItem {
  const _$_CardItem(
      {@required this.id,
      @required this.front,
      @required this.back,
      @required this.me,
      @required this.studied,
      @required this.color,
      @required this.tags})
      : assert(id != null),
        assert(front != null),
        assert(back != null),
        assert(me != null),
        assert(studied != null),
        assert(color != null),
        assert(tags != null),
        super._();

  @override
  final UniqueId id;
  @override
  final CardFront front;
  @override
  final CardBack back;
  @override
  final CardMe me;
  @override
  final bool studied;
  @override
  final Color color;
  @override
  final KtList<String> tags;

  @override
  String toString() {
    return 'CardItem(id: $id, front: $front, back: $back, me: $me, studied: $studied, color: $color, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardItem &&
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
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(front) ^
      const DeepCollectionEquality().hash(back) ^
      const DeepCollectionEquality().hash(me) ^
      const DeepCollectionEquality().hash(studied) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(tags);

  @override
  _$CardItemCopyWith<_CardItem> get copyWith =>
      __$CardItemCopyWithImpl<_CardItem>(this, _$identity);
}

abstract class _CardItem extends CardItem {
  const _CardItem._() : super._();
  const factory _CardItem(
      {@required UniqueId id,
      @required CardFront front,
      @required CardBack back,
      @required CardMe me,
      @required bool studied,
      @required Color color,
      @required KtList<String> tags}) = _$_CardItem;

  @override
  UniqueId get id;
  @override
  CardFront get front;
  @override
  CardBack get back;
  @override
  CardMe get me;
  @override
  bool get studied;
  @override
  Color get color;
  @override
  KtList<String> get tags;
  @override
  _$CardItemCopyWith<_CardItem> get copyWith;
}
