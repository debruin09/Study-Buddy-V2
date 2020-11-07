// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CardEventTearOff {
  const _$CardEventTearOff();

// ignore: unused_element
  LoadCards load() {
    return const LoadCards();
  }

// ignore: unused_element
  DeleteCard delete({@required MyCard card}) {
    return DeleteCard(
      card: card,
    );
  }

// ignore: unused_element
  UpdateCard update({@required MyCard updatedCard, @required MyCard newData}) {
    return UpdateCard(
      updatedCard: updatedCard,
      newData: newData,
    );
  }

// ignore: unused_element
  AddCard add({@required MyCard card}) {
    return AddCard(
      card: card,
    );
  }

// ignore: unused_element
  CardUpdated updated({@required Queue<MyCard> cards}) {
    return CardUpdated(
      cards: cards,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CardEvent = _$CardEventTearOff();

/// @nodoc
mixin _$CardEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(MyCard card),
    @required Result update(MyCard updatedCard, MyCard newData),
    @required Result add(MyCard card),
    @required Result updated(Queue<MyCard> cards),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(MyCard card),
    Result update(MyCard updatedCard, MyCard newData),
    Result add(MyCard card),
    Result updated(Queue<MyCard> cards),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadCards value),
    @required Result delete(DeleteCard value),
    @required Result update(UpdateCard value),
    @required Result add(AddCard value),
    @required Result updated(CardUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadCards value),
    Result delete(DeleteCard value),
    Result update(UpdateCard value),
    Result add(AddCard value),
    Result updated(CardUpdated value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $CardEventCopyWith<$Res> {
  factory $CardEventCopyWith(CardEvent value, $Res Function(CardEvent) then) =
      _$CardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardEventCopyWithImpl<$Res> implements $CardEventCopyWith<$Res> {
  _$CardEventCopyWithImpl(this._value, this._then);

  final CardEvent _value;
  // ignore: unused_field
  final $Res Function(CardEvent) _then;
}

/// @nodoc
abstract class $LoadCardsCopyWith<$Res> {
  factory $LoadCardsCopyWith(LoadCards value, $Res Function(LoadCards) then) =
      _$LoadCardsCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCardsCopyWithImpl<$Res> extends _$CardEventCopyWithImpl<$Res>
    implements $LoadCardsCopyWith<$Res> {
  _$LoadCardsCopyWithImpl(LoadCards _value, $Res Function(LoadCards) _then)
      : super(_value, (v) => _then(v as LoadCards));

  @override
  LoadCards get _value => super._value as LoadCards;
}

/// @nodoc
class _$LoadCards with DiagnosticableTreeMixin implements LoadCards {
  const _$LoadCards();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardEvent.load()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CardEvent.load'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadCards);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(MyCard card),
    @required Result update(MyCard updatedCard, MyCard newData),
    @required Result add(MyCard card),
    @required Result updated(Queue<MyCard> cards),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return load();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(MyCard card),
    Result update(MyCard updatedCard, MyCard newData),
    Result add(MyCard card),
    Result updated(Queue<MyCard> cards),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadCards value),
    @required Result delete(DeleteCard value),
    @required Result update(UpdateCard value),
    @required Result add(AddCard value),
    @required Result updated(CardUpdated value),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return load(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadCards value),
    Result delete(DeleteCard value),
    Result update(UpdateCard value),
    Result add(AddCard value),
    Result updated(CardUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadCards implements CardEvent {
  const factory LoadCards() = _$LoadCards;
}

/// @nodoc
abstract class $DeleteCardCopyWith<$Res> {
  factory $DeleteCardCopyWith(
          DeleteCard value, $Res Function(DeleteCard) then) =
      _$DeleteCardCopyWithImpl<$Res>;
  $Res call({MyCard card});
}

/// @nodoc
class _$DeleteCardCopyWithImpl<$Res> extends _$CardEventCopyWithImpl<$Res>
    implements $DeleteCardCopyWith<$Res> {
  _$DeleteCardCopyWithImpl(DeleteCard _value, $Res Function(DeleteCard) _then)
      : super(_value, (v) => _then(v as DeleteCard));

  @override
  DeleteCard get _value => super._value as DeleteCard;

  @override
  $Res call({
    Object card = freezed,
  }) {
    return _then(DeleteCard(
      card: card == freezed ? _value.card : card as MyCard,
    ));
  }
}

/// @nodoc
class _$DeleteCard with DiagnosticableTreeMixin implements DeleteCard {
  const _$DeleteCard({@required this.card}) : assert(card != null);

  @override
  final MyCard card;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardEvent.delete(card: $card)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardEvent.delete'))
      ..add(DiagnosticsProperty('card', card));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteCard &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(card);

  @override
  $DeleteCardCopyWith<DeleteCard> get copyWith =>
      _$DeleteCardCopyWithImpl<DeleteCard>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(MyCard card),
    @required Result update(MyCard updatedCard, MyCard newData),
    @required Result add(MyCard card),
    @required Result updated(Queue<MyCard> cards),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return delete(card);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(MyCard card),
    Result update(MyCard updatedCard, MyCard newData),
    Result add(MyCard card),
    Result updated(Queue<MyCard> cards),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadCards value),
    @required Result delete(DeleteCard value),
    @required Result update(UpdateCard value),
    @required Result add(AddCard value),
    @required Result updated(CardUpdated value),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return delete(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadCards value),
    Result delete(DeleteCard value),
    Result update(UpdateCard value),
    Result add(AddCard value),
    Result updated(CardUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteCard implements CardEvent {
  const factory DeleteCard({@required MyCard card}) = _$DeleteCard;

  MyCard get card;
  $DeleteCardCopyWith<DeleteCard> get copyWith;
}

/// @nodoc
abstract class $UpdateCardCopyWith<$Res> {
  factory $UpdateCardCopyWith(
          UpdateCard value, $Res Function(UpdateCard) then) =
      _$UpdateCardCopyWithImpl<$Res>;
  $Res call({MyCard updatedCard, MyCard newData});
}

/// @nodoc
class _$UpdateCardCopyWithImpl<$Res> extends _$CardEventCopyWithImpl<$Res>
    implements $UpdateCardCopyWith<$Res> {
  _$UpdateCardCopyWithImpl(UpdateCard _value, $Res Function(UpdateCard) _then)
      : super(_value, (v) => _then(v as UpdateCard));

  @override
  UpdateCard get _value => super._value as UpdateCard;

  @override
  $Res call({
    Object updatedCard = freezed,
    Object newData = freezed,
  }) {
    return _then(UpdateCard(
      updatedCard:
          updatedCard == freezed ? _value.updatedCard : updatedCard as MyCard,
      newData: newData == freezed ? _value.newData : newData as MyCard,
    ));
  }
}

/// @nodoc
class _$UpdateCard with DiagnosticableTreeMixin implements UpdateCard {
  const _$UpdateCard({@required this.updatedCard, @required this.newData})
      : assert(updatedCard != null),
        assert(newData != null);

  @override
  final MyCard updatedCard;
  @override
  final MyCard newData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardEvent.update(updatedCard: $updatedCard, newData: $newData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardEvent.update'))
      ..add(DiagnosticsProperty('updatedCard', updatedCard))
      ..add(DiagnosticsProperty('newData', newData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateCard &&
            (identical(other.updatedCard, updatedCard) ||
                const DeepCollectionEquality()
                    .equals(other.updatedCard, updatedCard)) &&
            (identical(other.newData, newData) ||
                const DeepCollectionEquality().equals(other.newData, newData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(updatedCard) ^
      const DeepCollectionEquality().hash(newData);

  @override
  $UpdateCardCopyWith<UpdateCard> get copyWith =>
      _$UpdateCardCopyWithImpl<UpdateCard>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(MyCard card),
    @required Result update(MyCard updatedCard, MyCard newData),
    @required Result add(MyCard card),
    @required Result updated(Queue<MyCard> cards),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return update(updatedCard, newData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(MyCard card),
    Result update(MyCard updatedCard, MyCard newData),
    Result add(MyCard card),
    Result updated(Queue<MyCard> cards),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(updatedCard, newData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadCards value),
    @required Result delete(DeleteCard value),
    @required Result update(UpdateCard value),
    @required Result add(AddCard value),
    @required Result updated(CardUpdated value),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadCards value),
    Result delete(DeleteCard value),
    Result update(UpdateCard value),
    Result add(AddCard value),
    Result updated(CardUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateCard implements CardEvent {
  const factory UpdateCard(
      {@required MyCard updatedCard, @required MyCard newData}) = _$UpdateCard;

  MyCard get updatedCard;
  MyCard get newData;
  $UpdateCardCopyWith<UpdateCard> get copyWith;
}

/// @nodoc
abstract class $AddCardCopyWith<$Res> {
  factory $AddCardCopyWith(AddCard value, $Res Function(AddCard) then) =
      _$AddCardCopyWithImpl<$Res>;
  $Res call({MyCard card});
}

/// @nodoc
class _$AddCardCopyWithImpl<$Res> extends _$CardEventCopyWithImpl<$Res>
    implements $AddCardCopyWith<$Res> {
  _$AddCardCopyWithImpl(AddCard _value, $Res Function(AddCard) _then)
      : super(_value, (v) => _then(v as AddCard));

  @override
  AddCard get _value => super._value as AddCard;

  @override
  $Res call({
    Object card = freezed,
  }) {
    return _then(AddCard(
      card: card == freezed ? _value.card : card as MyCard,
    ));
  }
}

/// @nodoc
class _$AddCard with DiagnosticableTreeMixin implements AddCard {
  const _$AddCard({@required this.card}) : assert(card != null);

  @override
  final MyCard card;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardEvent.add(card: $card)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardEvent.add'))
      ..add(DiagnosticsProperty('card', card));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddCard &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(card);

  @override
  $AddCardCopyWith<AddCard> get copyWith =>
      _$AddCardCopyWithImpl<AddCard>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(MyCard card),
    @required Result update(MyCard updatedCard, MyCard newData),
    @required Result add(MyCard card),
    @required Result updated(Queue<MyCard> cards),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return add(card);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(MyCard card),
    Result update(MyCard updatedCard, MyCard newData),
    Result add(MyCard card),
    Result updated(Queue<MyCard> cards),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadCards value),
    @required Result delete(DeleteCard value),
    @required Result update(UpdateCard value),
    @required Result add(AddCard value),
    @required Result updated(CardUpdated value),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return add(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadCards value),
    Result delete(DeleteCard value),
    Result update(UpdateCard value),
    Result add(AddCard value),
    Result updated(CardUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class AddCard implements CardEvent {
  const factory AddCard({@required MyCard card}) = _$AddCard;

  MyCard get card;
  $AddCardCopyWith<AddCard> get copyWith;
}

/// @nodoc
abstract class $CardUpdatedCopyWith<$Res> {
  factory $CardUpdatedCopyWith(
          CardUpdated value, $Res Function(CardUpdated) then) =
      _$CardUpdatedCopyWithImpl<$Res>;
  $Res call({Queue<MyCard> cards});
}

/// @nodoc
class _$CardUpdatedCopyWithImpl<$Res> extends _$CardEventCopyWithImpl<$Res>
    implements $CardUpdatedCopyWith<$Res> {
  _$CardUpdatedCopyWithImpl(
      CardUpdated _value, $Res Function(CardUpdated) _then)
      : super(_value, (v) => _then(v as CardUpdated));

  @override
  CardUpdated get _value => super._value as CardUpdated;

  @override
  $Res call({
    Object cards = freezed,
  }) {
    return _then(CardUpdated(
      cards: cards == freezed ? _value.cards : cards as Queue<MyCard>,
    ));
  }
}

/// @nodoc
class _$CardUpdated with DiagnosticableTreeMixin implements CardUpdated {
  const _$CardUpdated({@required this.cards}) : assert(cards != null);

  @override
  final Queue<MyCard> cards;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardEvent.updated(cards: $cards)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardEvent.updated'))
      ..add(DiagnosticsProperty('cards', cards));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CardUpdated &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cards);

  @override
  $CardUpdatedCopyWith<CardUpdated> get copyWith =>
      _$CardUpdatedCopyWithImpl<CardUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(MyCard card),
    @required Result update(MyCard updatedCard, MyCard newData),
    @required Result add(MyCard card),
    @required Result updated(Queue<MyCard> cards),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return updated(cards);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(MyCard card),
    Result update(MyCard updatedCard, MyCard newData),
    Result add(MyCard card),
    Result updated(Queue<MyCard> cards),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updated != null) {
      return updated(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadCards value),
    @required Result delete(DeleteCard value),
    @required Result update(UpdateCard value),
    @required Result add(AddCard value),
    @required Result updated(CardUpdated value),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return updated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadCards value),
    Result delete(DeleteCard value),
    Result update(UpdateCard value),
    Result add(AddCard value),
    Result updated(CardUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class CardUpdated implements CardEvent {
  const factory CardUpdated({@required Queue<MyCard> cards}) = _$CardUpdated;

  Queue<MyCard> get cards;
  $CardUpdatedCopyWith<CardUpdated> get copyWith;
}

/// @nodoc
class _$CardStateTearOff {
  const _$CardStateTearOff();

// ignore: unused_element
  CardInitial initial() {
    return const CardInitial();
  }

// ignore: unused_element
  CardLoadInProgress loading() {
    return const CardLoadInProgress();
  }

// ignore: unused_element
  CardLoadSuccess success({@required Queue<MyCard> cards}) {
    return CardLoadSuccess(
      cards: cards,
    );
  }

// ignore: unused_element
  EmptyCardState empty() {
    return const EmptyCardState();
  }

// ignore: unused_element
  CardErrorState error({@required String message}) {
    return CardErrorState(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CardState = _$CardStateTearOff();

/// @nodoc
mixin _$CardState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Queue<MyCard> cards),
    @required Result empty(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Queue<MyCard> cards),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(CardInitial value),
    @required Result loading(CardLoadInProgress value),
    @required Result success(CardLoadSuccess value),
    @required Result empty(EmptyCardState value),
    @required Result error(CardErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(CardInitial value),
    Result loading(CardLoadInProgress value),
    Result success(CardLoadSuccess value),
    Result empty(EmptyCardState value),
    Result error(CardErrorState value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res> implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  final CardState _value;
  // ignore: unused_field
  final $Res Function(CardState) _then;
}

/// @nodoc
abstract class $CardInitialCopyWith<$Res> {
  factory $CardInitialCopyWith(
          CardInitial value, $Res Function(CardInitial) then) =
      _$CardInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardInitialCopyWithImpl<$Res> extends _$CardStateCopyWithImpl<$Res>
    implements $CardInitialCopyWith<$Res> {
  _$CardInitialCopyWithImpl(
      CardInitial _value, $Res Function(CardInitial) _then)
      : super(_value, (v) => _then(v as CardInitial));

  @override
  CardInitial get _value => super._value as CardInitial;
}

/// @nodoc
class _$CardInitial with DiagnosticableTreeMixin implements CardInitial {
  const _$CardInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CardState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CardInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Queue<MyCard> cards),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Queue<MyCard> cards),
    Result empty(),
    Result error(String message),
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
    @required Result initial(CardInitial value),
    @required Result loading(CardLoadInProgress value),
    @required Result success(CardLoadSuccess value),
    @required Result empty(EmptyCardState value),
    @required Result error(CardErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(CardInitial value),
    Result loading(CardLoadInProgress value),
    Result success(CardLoadSuccess value),
    Result empty(EmptyCardState value),
    Result error(CardErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CardInitial implements CardState {
  const factory CardInitial() = _$CardInitial;
}

/// @nodoc
abstract class $CardLoadInProgressCopyWith<$Res> {
  factory $CardLoadInProgressCopyWith(
          CardLoadInProgress value, $Res Function(CardLoadInProgress) then) =
      _$CardLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardLoadInProgressCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res>
    implements $CardLoadInProgressCopyWith<$Res> {
  _$CardLoadInProgressCopyWithImpl(
      CardLoadInProgress _value, $Res Function(CardLoadInProgress) _then)
      : super(_value, (v) => _then(v as CardLoadInProgress));

  @override
  CardLoadInProgress get _value => super._value as CardLoadInProgress;
}

/// @nodoc
class _$CardLoadInProgress
    with DiagnosticableTreeMixin
    implements CardLoadInProgress {
  const _$CardLoadInProgress();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CardState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CardLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Queue<MyCard> cards),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Queue<MyCard> cards),
    Result empty(),
    Result error(String message),
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
    @required Result initial(CardInitial value),
    @required Result loading(CardLoadInProgress value),
    @required Result success(CardLoadSuccess value),
    @required Result empty(EmptyCardState value),
    @required Result error(CardErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(CardInitial value),
    Result loading(CardLoadInProgress value),
    Result success(CardLoadSuccess value),
    Result empty(EmptyCardState value),
    Result error(CardErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CardLoadInProgress implements CardState {
  const factory CardLoadInProgress() = _$CardLoadInProgress;
}

/// @nodoc
abstract class $CardLoadSuccessCopyWith<$Res> {
  factory $CardLoadSuccessCopyWith(
          CardLoadSuccess value, $Res Function(CardLoadSuccess) then) =
      _$CardLoadSuccessCopyWithImpl<$Res>;
  $Res call({Queue<MyCard> cards});
}

/// @nodoc
class _$CardLoadSuccessCopyWithImpl<$Res> extends _$CardStateCopyWithImpl<$Res>
    implements $CardLoadSuccessCopyWith<$Res> {
  _$CardLoadSuccessCopyWithImpl(
      CardLoadSuccess _value, $Res Function(CardLoadSuccess) _then)
      : super(_value, (v) => _then(v as CardLoadSuccess));

  @override
  CardLoadSuccess get _value => super._value as CardLoadSuccess;

  @override
  $Res call({
    Object cards = freezed,
  }) {
    return _then(CardLoadSuccess(
      cards: cards == freezed ? _value.cards : cards as Queue<MyCard>,
    ));
  }
}

/// @nodoc
class _$CardLoadSuccess
    with DiagnosticableTreeMixin
    implements CardLoadSuccess {
  const _$CardLoadSuccess({@required this.cards}) : assert(cards != null);

  @override
  final Queue<MyCard> cards;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardState.success(cards: $cards)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardState.success'))
      ..add(DiagnosticsProperty('cards', cards));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CardLoadSuccess &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cards);

  @override
  $CardLoadSuccessCopyWith<CardLoadSuccess> get copyWith =>
      _$CardLoadSuccessCopyWithImpl<CardLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Queue<MyCard> cards),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return success(cards);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Queue<MyCard> cards),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(CardInitial value),
    @required Result loading(CardLoadInProgress value),
    @required Result success(CardLoadSuccess value),
    @required Result empty(EmptyCardState value),
    @required Result error(CardErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(CardInitial value),
    Result loading(CardLoadInProgress value),
    Result success(CardLoadSuccess value),
    Result empty(EmptyCardState value),
    Result error(CardErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CardLoadSuccess implements CardState {
  const factory CardLoadSuccess({@required Queue<MyCard> cards}) =
      _$CardLoadSuccess;

  Queue<MyCard> get cards;
  $CardLoadSuccessCopyWith<CardLoadSuccess> get copyWith;
}

/// @nodoc
abstract class $EmptyCardStateCopyWith<$Res> {
  factory $EmptyCardStateCopyWith(
          EmptyCardState value, $Res Function(EmptyCardState) then) =
      _$EmptyCardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyCardStateCopyWithImpl<$Res> extends _$CardStateCopyWithImpl<$Res>
    implements $EmptyCardStateCopyWith<$Res> {
  _$EmptyCardStateCopyWithImpl(
      EmptyCardState _value, $Res Function(EmptyCardState) _then)
      : super(_value, (v) => _then(v as EmptyCardState));

  @override
  EmptyCardState get _value => super._value as EmptyCardState;
}

/// @nodoc
class _$EmptyCardState with DiagnosticableTreeMixin implements EmptyCardState {
  const _$EmptyCardState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CardState.empty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmptyCardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Queue<MyCard> cards),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Queue<MyCard> cards),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(CardInitial value),
    @required Result loading(CardLoadInProgress value),
    @required Result success(CardLoadSuccess value),
    @required Result empty(EmptyCardState value),
    @required Result error(CardErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(CardInitial value),
    Result loading(CardLoadInProgress value),
    Result success(CardLoadSuccess value),
    Result empty(EmptyCardState value),
    Result error(CardErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyCardState implements CardState {
  const factory EmptyCardState() = _$EmptyCardState;
}

/// @nodoc
abstract class $CardErrorStateCopyWith<$Res> {
  factory $CardErrorStateCopyWith(
          CardErrorState value, $Res Function(CardErrorState) then) =
      _$CardErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$CardErrorStateCopyWithImpl<$Res> extends _$CardStateCopyWithImpl<$Res>
    implements $CardErrorStateCopyWith<$Res> {
  _$CardErrorStateCopyWithImpl(
      CardErrorState _value, $Res Function(CardErrorState) _then)
      : super(_value, (v) => _then(v as CardErrorState));

  @override
  CardErrorState get _value => super._value as CardErrorState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(CardErrorState(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$CardErrorState with DiagnosticableTreeMixin implements CardErrorState {
  const _$CardErrorState({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CardErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $CardErrorStateCopyWith<CardErrorState> get copyWith =>
      _$CardErrorStateCopyWithImpl<CardErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(Queue<MyCard> cards),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(Queue<MyCard> cards),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(CardInitial value),
    @required Result loading(CardLoadInProgress value),
    @required Result success(CardLoadSuccess value),
    @required Result empty(EmptyCardState value),
    @required Result error(CardErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(empty != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(CardInitial value),
    Result loading(CardLoadInProgress value),
    Result success(CardLoadSuccess value),
    Result empty(EmptyCardState value),
    Result error(CardErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CardErrorState implements CardState {
  const factory CardErrorState({@required String message}) = _$CardErrorState;

  String get message;
  $CardErrorStateCopyWith<CardErrorState> get copyWith;
}
