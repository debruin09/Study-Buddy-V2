// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'card_item_presentation_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CardItemPrimitiveTearOff {
  const _$CardItemPrimitiveTearOff();

// ignore: unused_element
  _CardItemPrimitive call(
      {@required UniqueId id,
      @required String front,
      @required String back,
      @required String me,
      @required bool studied,
      @required int color,
      @required List<String> tags}) {
    return _CardItemPrimitive(
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
const $CardItemPrimitive = _$CardItemPrimitiveTearOff();

/// @nodoc
mixin _$CardItemPrimitive {
  UniqueId get id;
  String get front;
  String get back;
  String get me;
  bool get studied;
  int get color;
  List<String> get tags;

  $CardItemPrimitiveCopyWith<CardItemPrimitive> get copyWith;
}

/// @nodoc
abstract class $CardItemPrimitiveCopyWith<$Res> {
  factory $CardItemPrimitiveCopyWith(
          CardItemPrimitive value, $Res Function(CardItemPrimitive) then) =
      _$CardItemPrimitiveCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      String front,
      String back,
      String me,
      bool studied,
      int color,
      List<String> tags});
}

/// @nodoc
class _$CardItemPrimitiveCopyWithImpl<$Res>
    implements $CardItemPrimitiveCopyWith<$Res> {
  _$CardItemPrimitiveCopyWithImpl(this._value, this._then);

  final CardItemPrimitive _value;
  // ignore: unused_field
  final $Res Function(CardItemPrimitive) _then;

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
      front: front == freezed ? _value.front : front as String,
      back: back == freezed ? _value.back : back as String,
      me: me == freezed ? _value.me : me as String,
      studied: studied == freezed ? _value.studied : studied as bool,
      color: color == freezed ? _value.color : color as int,
      tags: tags == freezed ? _value.tags : tags as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CardItemPrimitiveCopyWith<$Res>
    implements $CardItemPrimitiveCopyWith<$Res> {
  factory _$CardItemPrimitiveCopyWith(
          _CardItemPrimitive value, $Res Function(_CardItemPrimitive) then) =
      __$CardItemPrimitiveCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      String front,
      String back,
      String me,
      bool studied,
      int color,
      List<String> tags});
}

/// @nodoc
class __$CardItemPrimitiveCopyWithImpl<$Res>
    extends _$CardItemPrimitiveCopyWithImpl<$Res>
    implements _$CardItemPrimitiveCopyWith<$Res> {
  __$CardItemPrimitiveCopyWithImpl(
      _CardItemPrimitive _value, $Res Function(_CardItemPrimitive) _then)
      : super(_value, (v) => _then(v as _CardItemPrimitive));

  @override
  _CardItemPrimitive get _value => super._value as _CardItemPrimitive;

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
    return _then(_CardItemPrimitive(
      id: id == freezed ? _value.id : id as UniqueId,
      front: front == freezed ? _value.front : front as String,
      back: back == freezed ? _value.back : back as String,
      me: me == freezed ? _value.me : me as String,
      studied: studied == freezed ? _value.studied : studied as bool,
      color: color == freezed ? _value.color : color as int,
      tags: tags == freezed ? _value.tags : tags as List<String>,
    ));
  }
}

/// @nodoc
class _$_CardItemPrimitive extends _CardItemPrimitive {
  const _$_CardItemPrimitive(
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
  final List<String> tags;

  @override
  String toString() {
    return 'CardItemPrimitive(id: $id, front: $front, back: $back, me: $me, studied: $studied, color: $color, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardItemPrimitive &&
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
  _$CardItemPrimitiveCopyWith<_CardItemPrimitive> get copyWith =>
      __$CardItemPrimitiveCopyWithImpl<_CardItemPrimitive>(this, _$identity);
}

abstract class _CardItemPrimitive extends CardItemPrimitive {
  const _CardItemPrimitive._() : super._();
  const factory _CardItemPrimitive(
      {@required UniqueId id,
      @required String front,
      @required String back,
      @required String me,
      @required bool studied,
      @required int color,
      @required List<String> tags}) = _$_CardItemPrimitive;

  @override
  UniqueId get id;
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
  List<String> get tags;
  @override
  _$CardItemPrimitiveCopyWith<_CardItemPrimitive> get copyWith;
}
