// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DeckStatusStateTearOff {
  const _$DeckStatusStateTearOff();

// ignore: unused_element
  NewDeckState newDeck() {
    return const NewDeckState();
  }

// ignore: unused_element
  EditDeckState editDeck() {
    return const EditDeckState();
  }
}

/// @nodoc
// ignore: unused_element
const $DeckStatusState = _$DeckStatusStateTearOff();

/// @nodoc
mixin _$DeckStatusState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newDeck(),
    @required Result editDeck(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newDeck(),
    Result editDeck(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newDeck(NewDeckState value),
    @required Result editDeck(EditDeckState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newDeck(NewDeckState value),
    Result editDeck(EditDeckState value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DeckStatusStateCopyWith<$Res> {
  factory $DeckStatusStateCopyWith(
          DeckStatusState value, $Res Function(DeckStatusState) then) =
      _$DeckStatusStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckStatusStateCopyWithImpl<$Res>
    implements $DeckStatusStateCopyWith<$Res> {
  _$DeckStatusStateCopyWithImpl(this._value, this._then);

  final DeckStatusState _value;
  // ignore: unused_field
  final $Res Function(DeckStatusState) _then;
}

/// @nodoc
abstract class $NewDeckStateCopyWith<$Res> {
  factory $NewDeckStateCopyWith(
          NewDeckState value, $Res Function(NewDeckState) then) =
      _$NewDeckStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewDeckStateCopyWithImpl<$Res>
    extends _$DeckStatusStateCopyWithImpl<$Res>
    implements $NewDeckStateCopyWith<$Res> {
  _$NewDeckStateCopyWithImpl(
      NewDeckState _value, $Res Function(NewDeckState) _then)
      : super(_value, (v) => _then(v as NewDeckState));

  @override
  NewDeckState get _value => super._value as NewDeckState;
}

/// @nodoc
class _$NewDeckState implements NewDeckState {
  const _$NewDeckState();

  @override
  String toString() {
    return 'DeckStatusState.newDeck()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NewDeckState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newDeck(),
    @required Result editDeck(),
  }) {
    assert(newDeck != null);
    assert(editDeck != null);
    return newDeck();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newDeck(),
    Result editDeck(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newDeck != null) {
      return newDeck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newDeck(NewDeckState value),
    @required Result editDeck(EditDeckState value),
  }) {
    assert(newDeck != null);
    assert(editDeck != null);
    return newDeck(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newDeck(NewDeckState value),
    Result editDeck(EditDeckState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newDeck != null) {
      return newDeck(this);
    }
    return orElse();
  }
}

abstract class NewDeckState implements DeckStatusState {
  const factory NewDeckState() = _$NewDeckState;
}

/// @nodoc
abstract class $EditDeckStateCopyWith<$Res> {
  factory $EditDeckStateCopyWith(
          EditDeckState value, $Res Function(EditDeckState) then) =
      _$EditDeckStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditDeckStateCopyWithImpl<$Res>
    extends _$DeckStatusStateCopyWithImpl<$Res>
    implements $EditDeckStateCopyWith<$Res> {
  _$EditDeckStateCopyWithImpl(
      EditDeckState _value, $Res Function(EditDeckState) _then)
      : super(_value, (v) => _then(v as EditDeckState));

  @override
  EditDeckState get _value => super._value as EditDeckState;
}

/// @nodoc
class _$EditDeckState implements EditDeckState {
  const _$EditDeckState();

  @override
  String toString() {
    return 'DeckStatusState.editDeck()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditDeckState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newDeck(),
    @required Result editDeck(),
  }) {
    assert(newDeck != null);
    assert(editDeck != null);
    return editDeck();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newDeck(),
    Result editDeck(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editDeck != null) {
      return editDeck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newDeck(NewDeckState value),
    @required Result editDeck(EditDeckState value),
  }) {
    assert(newDeck != null);
    assert(editDeck != null);
    return editDeck(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newDeck(NewDeckState value),
    Result editDeck(EditDeckState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editDeck != null) {
      return editDeck(this);
    }
    return orElse();
  }
}

abstract class EditDeckState implements DeckStatusState {
  const factory EditDeckState() = _$EditDeckState;
}

/// @nodoc
class _$CardStatusStateTearOff {
  const _$CardStatusStateTearOff();

// ignore: unused_element
  NewCardState newCard() {
    return const NewCardState();
  }

// ignore: unused_element
  EditCardState editCard() {
    return const EditCardState();
  }
}

/// @nodoc
// ignore: unused_element
const $CardStatusState = _$CardStatusStateTearOff();

/// @nodoc
mixin _$CardStatusState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newCard(),
    @required Result editCard(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newCard(),
    Result editCard(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newCard(NewCardState value),
    @required Result editCard(EditCardState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newCard(NewCardState value),
    Result editCard(EditCardState value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $CardStatusStateCopyWith<$Res> {
  factory $CardStatusStateCopyWith(
          CardStatusState value, $Res Function(CardStatusState) then) =
      _$CardStatusStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardStatusStateCopyWithImpl<$Res>
    implements $CardStatusStateCopyWith<$Res> {
  _$CardStatusStateCopyWithImpl(this._value, this._then);

  final CardStatusState _value;
  // ignore: unused_field
  final $Res Function(CardStatusState) _then;
}

/// @nodoc
abstract class $NewCardStateCopyWith<$Res> {
  factory $NewCardStateCopyWith(
          NewCardState value, $Res Function(NewCardState) then) =
      _$NewCardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewCardStateCopyWithImpl<$Res>
    extends _$CardStatusStateCopyWithImpl<$Res>
    implements $NewCardStateCopyWith<$Res> {
  _$NewCardStateCopyWithImpl(
      NewCardState _value, $Res Function(NewCardState) _then)
      : super(_value, (v) => _then(v as NewCardState));

  @override
  NewCardState get _value => super._value as NewCardState;
}

/// @nodoc
class _$NewCardState implements NewCardState {
  const _$NewCardState();

  @override
  String toString() {
    return 'CardStatusState.newCard()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NewCardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newCard(),
    @required Result editCard(),
  }) {
    assert(newCard != null);
    assert(editCard != null);
    return newCard();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newCard(),
    Result editCard(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newCard != null) {
      return newCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newCard(NewCardState value),
    @required Result editCard(EditCardState value),
  }) {
    assert(newCard != null);
    assert(editCard != null);
    return newCard(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newCard(NewCardState value),
    Result editCard(EditCardState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newCard != null) {
      return newCard(this);
    }
    return orElse();
  }
}

abstract class NewCardState implements CardStatusState {
  const factory NewCardState() = _$NewCardState;
}

/// @nodoc
abstract class $EditCardStateCopyWith<$Res> {
  factory $EditCardStateCopyWith(
          EditCardState value, $Res Function(EditCardState) then) =
      _$EditCardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditCardStateCopyWithImpl<$Res>
    extends _$CardStatusStateCopyWithImpl<$Res>
    implements $EditCardStateCopyWith<$Res> {
  _$EditCardStateCopyWithImpl(
      EditCardState _value, $Res Function(EditCardState) _then)
      : super(_value, (v) => _then(v as EditCardState));

  @override
  EditCardState get _value => super._value as EditCardState;
}

/// @nodoc
class _$EditCardState implements EditCardState {
  const _$EditCardState();

  @override
  String toString() {
    return 'CardStatusState.editCard()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditCardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result newCard(),
    @required Result editCard(),
  }) {
    assert(newCard != null);
    assert(editCard != null);
    return editCard();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result newCard(),
    Result editCard(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editCard != null) {
      return editCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result newCard(NewCardState value),
    @required Result editCard(EditCardState value),
  }) {
    assert(newCard != null);
    assert(editCard != null);
    return editCard(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result newCard(NewCardState value),
    Result editCard(EditCardState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editCard != null) {
      return editCard(this);
    }
    return orElse();
  }
}

abstract class EditCardState implements CardStatusState {
  const factory EditCardState() = _$EditCardState;
}
