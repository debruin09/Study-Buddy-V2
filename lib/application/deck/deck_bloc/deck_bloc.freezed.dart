// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DeckEventTearOff {
  const _$DeckEventTearOff();

// ignore: unused_element
  LoadDecks load() {
    return const LoadDecks();
  }

// ignore: unused_element
  DeleteDeck delete({@required Deck deck}) {
    return DeleteDeck(
      deck: deck,
    );
  }

// ignore: unused_element
  UpdateDeck update({@required Deck updatedDeck, @required Deck newData}) {
    return UpdateDeck(
      updatedDeck: updatedDeck,
      newData: newData,
    );
  }

// ignore: unused_element
  AddDeck add({@required Deck deck}) {
    return AddDeck(
      deck: deck,
    );
  }

// ignore: unused_element
  DeckUpdated updated({@required List<Deck> decks}) {
    return DeckUpdated(
      decks: decks,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DeckEvent = _$DeckEventTearOff();

/// @nodoc
mixin _$DeckEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(Deck deck),
    @required Result update(Deck updatedDeck, Deck newData),
    @required Result add(Deck deck),
    @required Result updated(List<Deck> decks),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(Deck deck),
    Result update(Deck updatedDeck, Deck newData),
    Result add(Deck deck),
    Result updated(List<Deck> decks),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadDecks value),
    @required Result delete(DeleteDeck value),
    @required Result update(UpdateDeck value),
    @required Result add(AddDeck value),
    @required Result updated(DeckUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(LoadDecks value),
    Result delete(DeleteDeck value),
    Result update(UpdateDeck value),
    Result add(AddDeck value),
    Result updated(DeckUpdated value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DeckEventCopyWith<$Res> {
  factory $DeckEventCopyWith(DeckEvent value, $Res Function(DeckEvent) then) =
      _$DeckEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckEventCopyWithImpl<$Res> implements $DeckEventCopyWith<$Res> {
  _$DeckEventCopyWithImpl(this._value, this._then);

  final DeckEvent _value;
  // ignore: unused_field
  final $Res Function(DeckEvent) _then;
}

/// @nodoc
abstract class $LoadDecksCopyWith<$Res> {
  factory $LoadDecksCopyWith(LoadDecks value, $Res Function(LoadDecks) then) =
      _$LoadDecksCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadDecksCopyWithImpl<$Res> extends _$DeckEventCopyWithImpl<$Res>
    implements $LoadDecksCopyWith<$Res> {
  _$LoadDecksCopyWithImpl(LoadDecks _value, $Res Function(LoadDecks) _then)
      : super(_value, (v) => _then(v as LoadDecks));

  @override
  LoadDecks get _value => super._value as LoadDecks;
}

/// @nodoc
class _$LoadDecks with DiagnosticableTreeMixin implements LoadDecks {
  const _$LoadDecks();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckEvent.load()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DeckEvent.load'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadDecks);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(Deck deck),
    @required Result update(Deck updatedDeck, Deck newData),
    @required Result add(Deck deck),
    @required Result updated(List<Deck> decks),
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
    Result delete(Deck deck),
    Result update(Deck updatedDeck, Deck newData),
    Result add(Deck deck),
    Result updated(List<Deck> decks),
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
    @required Result load(LoadDecks value),
    @required Result delete(DeleteDeck value),
    @required Result update(UpdateDeck value),
    @required Result add(AddDeck value),
    @required Result updated(DeckUpdated value),
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
    Result load(LoadDecks value),
    Result delete(DeleteDeck value),
    Result update(UpdateDeck value),
    Result add(AddDeck value),
    Result updated(DeckUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadDecks implements DeckEvent {
  const factory LoadDecks() = _$LoadDecks;
}

/// @nodoc
abstract class $DeleteDeckCopyWith<$Res> {
  factory $DeleteDeckCopyWith(
          DeleteDeck value, $Res Function(DeleteDeck) then) =
      _$DeleteDeckCopyWithImpl<$Res>;
  $Res call({Deck deck});
}

/// @nodoc
class _$DeleteDeckCopyWithImpl<$Res> extends _$DeckEventCopyWithImpl<$Res>
    implements $DeleteDeckCopyWith<$Res> {
  _$DeleteDeckCopyWithImpl(DeleteDeck _value, $Res Function(DeleteDeck) _then)
      : super(_value, (v) => _then(v as DeleteDeck));

  @override
  DeleteDeck get _value => super._value as DeleteDeck;

  @override
  $Res call({
    Object deck = freezed,
  }) {
    return _then(DeleteDeck(
      deck: deck == freezed ? _value.deck : deck as Deck,
    ));
  }
}

/// @nodoc
class _$DeleteDeck with DiagnosticableTreeMixin implements DeleteDeck {
  const _$DeleteDeck({@required this.deck}) : assert(deck != null);

  @override
  final Deck deck;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckEvent.delete(deck: $deck)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeckEvent.delete'))
      ..add(DiagnosticsProperty('deck', deck));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteDeck &&
            (identical(other.deck, deck) ||
                const DeepCollectionEquality().equals(other.deck, deck)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(deck);

  @override
  $DeleteDeckCopyWith<DeleteDeck> get copyWith =>
      _$DeleteDeckCopyWithImpl<DeleteDeck>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(Deck deck),
    @required Result update(Deck updatedDeck, Deck newData),
    @required Result add(Deck deck),
    @required Result updated(List<Deck> decks),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return delete(deck);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(Deck deck),
    Result update(Deck updatedDeck, Deck newData),
    Result add(Deck deck),
    Result updated(List<Deck> decks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(deck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadDecks value),
    @required Result delete(DeleteDeck value),
    @required Result update(UpdateDeck value),
    @required Result add(AddDeck value),
    @required Result updated(DeckUpdated value),
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
    Result load(LoadDecks value),
    Result delete(DeleteDeck value),
    Result update(UpdateDeck value),
    Result add(AddDeck value),
    Result updated(DeckUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteDeck implements DeckEvent {
  const factory DeleteDeck({@required Deck deck}) = _$DeleteDeck;

  Deck get deck;
  $DeleteDeckCopyWith<DeleteDeck> get copyWith;
}

/// @nodoc
abstract class $UpdateDeckCopyWith<$Res> {
  factory $UpdateDeckCopyWith(
          UpdateDeck value, $Res Function(UpdateDeck) then) =
      _$UpdateDeckCopyWithImpl<$Res>;
  $Res call({Deck updatedDeck, Deck newData});
}

/// @nodoc
class _$UpdateDeckCopyWithImpl<$Res> extends _$DeckEventCopyWithImpl<$Res>
    implements $UpdateDeckCopyWith<$Res> {
  _$UpdateDeckCopyWithImpl(UpdateDeck _value, $Res Function(UpdateDeck) _then)
      : super(_value, (v) => _then(v as UpdateDeck));

  @override
  UpdateDeck get _value => super._value as UpdateDeck;

  @override
  $Res call({
    Object updatedDeck = freezed,
    Object newData = freezed,
  }) {
    return _then(UpdateDeck(
      updatedDeck:
          updatedDeck == freezed ? _value.updatedDeck : updatedDeck as Deck,
      newData: newData == freezed ? _value.newData : newData as Deck,
    ));
  }
}

/// @nodoc
class _$UpdateDeck with DiagnosticableTreeMixin implements UpdateDeck {
  const _$UpdateDeck({@required this.updatedDeck, @required this.newData})
      : assert(updatedDeck != null),
        assert(newData != null);

  @override
  final Deck updatedDeck;
  @override
  final Deck newData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckEvent.update(updatedDeck: $updatedDeck, newData: $newData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeckEvent.update'))
      ..add(DiagnosticsProperty('updatedDeck', updatedDeck))
      ..add(DiagnosticsProperty('newData', newData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateDeck &&
            (identical(other.updatedDeck, updatedDeck) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDeck, updatedDeck)) &&
            (identical(other.newData, newData) ||
                const DeepCollectionEquality().equals(other.newData, newData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(updatedDeck) ^
      const DeepCollectionEquality().hash(newData);

  @override
  $UpdateDeckCopyWith<UpdateDeck> get copyWith =>
      _$UpdateDeckCopyWithImpl<UpdateDeck>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(Deck deck),
    @required Result update(Deck updatedDeck, Deck newData),
    @required Result add(Deck deck),
    @required Result updated(List<Deck> decks),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return update(updatedDeck, newData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(Deck deck),
    Result update(Deck updatedDeck, Deck newData),
    Result add(Deck deck),
    Result updated(List<Deck> decks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(updatedDeck, newData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadDecks value),
    @required Result delete(DeleteDeck value),
    @required Result update(UpdateDeck value),
    @required Result add(AddDeck value),
    @required Result updated(DeckUpdated value),
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
    Result load(LoadDecks value),
    Result delete(DeleteDeck value),
    Result update(UpdateDeck value),
    Result add(AddDeck value),
    Result updated(DeckUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateDeck implements DeckEvent {
  const factory UpdateDeck(
      {@required Deck updatedDeck, @required Deck newData}) = _$UpdateDeck;

  Deck get updatedDeck;
  Deck get newData;
  $UpdateDeckCopyWith<UpdateDeck> get copyWith;
}

/// @nodoc
abstract class $AddDeckCopyWith<$Res> {
  factory $AddDeckCopyWith(AddDeck value, $Res Function(AddDeck) then) =
      _$AddDeckCopyWithImpl<$Res>;
  $Res call({Deck deck});
}

/// @nodoc
class _$AddDeckCopyWithImpl<$Res> extends _$DeckEventCopyWithImpl<$Res>
    implements $AddDeckCopyWith<$Res> {
  _$AddDeckCopyWithImpl(AddDeck _value, $Res Function(AddDeck) _then)
      : super(_value, (v) => _then(v as AddDeck));

  @override
  AddDeck get _value => super._value as AddDeck;

  @override
  $Res call({
    Object deck = freezed,
  }) {
    return _then(AddDeck(
      deck: deck == freezed ? _value.deck : deck as Deck,
    ));
  }
}

/// @nodoc
class _$AddDeck with DiagnosticableTreeMixin implements AddDeck {
  const _$AddDeck({@required this.deck}) : assert(deck != null);

  @override
  final Deck deck;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckEvent.add(deck: $deck)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeckEvent.add'))
      ..add(DiagnosticsProperty('deck', deck));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddDeck &&
            (identical(other.deck, deck) ||
                const DeepCollectionEquality().equals(other.deck, deck)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(deck);

  @override
  $AddDeckCopyWith<AddDeck> get copyWith =>
      _$AddDeckCopyWithImpl<AddDeck>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(Deck deck),
    @required Result update(Deck updatedDeck, Deck newData),
    @required Result add(Deck deck),
    @required Result updated(List<Deck> decks),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return add(deck);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(Deck deck),
    Result update(Deck updatedDeck, Deck newData),
    Result add(Deck deck),
    Result updated(List<Deck> decks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(deck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadDecks value),
    @required Result delete(DeleteDeck value),
    @required Result update(UpdateDeck value),
    @required Result add(AddDeck value),
    @required Result updated(DeckUpdated value),
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
    Result load(LoadDecks value),
    Result delete(DeleteDeck value),
    Result update(UpdateDeck value),
    Result add(AddDeck value),
    Result updated(DeckUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class AddDeck implements DeckEvent {
  const factory AddDeck({@required Deck deck}) = _$AddDeck;

  Deck get deck;
  $AddDeckCopyWith<AddDeck> get copyWith;
}

/// @nodoc
abstract class $DeckUpdatedCopyWith<$Res> {
  factory $DeckUpdatedCopyWith(
          DeckUpdated value, $Res Function(DeckUpdated) then) =
      _$DeckUpdatedCopyWithImpl<$Res>;
  $Res call({List<Deck> decks});
}

/// @nodoc
class _$DeckUpdatedCopyWithImpl<$Res> extends _$DeckEventCopyWithImpl<$Res>
    implements $DeckUpdatedCopyWith<$Res> {
  _$DeckUpdatedCopyWithImpl(
      DeckUpdated _value, $Res Function(DeckUpdated) _then)
      : super(_value, (v) => _then(v as DeckUpdated));

  @override
  DeckUpdated get _value => super._value as DeckUpdated;

  @override
  $Res call({
    Object decks = freezed,
  }) {
    return _then(DeckUpdated(
      decks: decks == freezed ? _value.decks : decks as List<Deck>,
    ));
  }
}

/// @nodoc
class _$DeckUpdated with DiagnosticableTreeMixin implements DeckUpdated {
  const _$DeckUpdated({@required this.decks}) : assert(decks != null);

  @override
  final List<Deck> decks;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckEvent.updated(decks: $decks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeckEvent.updated'))
      ..add(DiagnosticsProperty('decks', decks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckUpdated &&
            (identical(other.decks, decks) ||
                const DeepCollectionEquality().equals(other.decks, decks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(decks);

  @override
  $DeckUpdatedCopyWith<DeckUpdated> get copyWith =>
      _$DeckUpdatedCopyWithImpl<DeckUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result load(),
    @required Result delete(Deck deck),
    @required Result update(Deck updatedDeck, Deck newData),
    @required Result add(Deck deck),
    @required Result updated(List<Deck> decks),
  }) {
    assert(load != null);
    assert(delete != null);
    assert(update != null);
    assert(add != null);
    assert(updated != null);
    return updated(decks);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(),
    Result delete(Deck deck),
    Result update(Deck updatedDeck, Deck newData),
    Result add(Deck deck),
    Result updated(List<Deck> decks),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updated != null) {
      return updated(decks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(LoadDecks value),
    @required Result delete(DeleteDeck value),
    @required Result update(UpdateDeck value),
    @required Result add(AddDeck value),
    @required Result updated(DeckUpdated value),
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
    Result load(LoadDecks value),
    Result delete(DeleteDeck value),
    Result update(UpdateDeck value),
    Result add(AddDeck value),
    Result updated(DeckUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class DeckUpdated implements DeckEvent {
  const factory DeckUpdated({@required List<Deck> decks}) = _$DeckUpdated;

  List<Deck> get decks;
  $DeckUpdatedCopyWith<DeckUpdated> get copyWith;
}

/// @nodoc
class _$DeckStateTearOff {
  const _$DeckStateTearOff();

// ignore: unused_element
  DeckInitial initial() {
    return const DeckInitial();
  }

// ignore: unused_element
  DeckLoadInProgress loading() {
    return const DeckLoadInProgress();
  }

// ignore: unused_element
  DeckLoadSuccess success({@required List<Deck> decks}) {
    return DeckLoadSuccess(
      decks: decks,
    );
  }

// ignore: unused_element
  DeckErrorState error({@required String message}) {
    return DeckErrorState(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DeckState = _$DeckStateTearOff();

/// @nodoc
mixin _$DeckState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(List<Deck> decks),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(List<Deck> decks),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DeckInitial value),
    @required Result loading(DeckLoadInProgress value),
    @required Result success(DeckLoadSuccess value),
    @required Result error(DeckErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(DeckInitial value),
    Result loading(DeckLoadInProgress value),
    Result success(DeckLoadSuccess value),
    Result error(DeckErrorState value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DeckStateCopyWith<$Res> {
  factory $DeckStateCopyWith(DeckState value, $Res Function(DeckState) then) =
      _$DeckStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckStateCopyWithImpl<$Res> implements $DeckStateCopyWith<$Res> {
  _$DeckStateCopyWithImpl(this._value, this._then);

  final DeckState _value;
  // ignore: unused_field
  final $Res Function(DeckState) _then;
}

/// @nodoc
abstract class $DeckInitialCopyWith<$Res> {
  factory $DeckInitialCopyWith(
          DeckInitial value, $Res Function(DeckInitial) then) =
      _$DeckInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckInitialCopyWithImpl<$Res> extends _$DeckStateCopyWithImpl<$Res>
    implements $DeckInitialCopyWith<$Res> {
  _$DeckInitialCopyWithImpl(
      DeckInitial _value, $Res Function(DeckInitial) _then)
      : super(_value, (v) => _then(v as DeckInitial));

  @override
  DeckInitial get _value => super._value as DeckInitial;
}

/// @nodoc
class _$DeckInitial with DiagnosticableTreeMixin implements DeckInitial {
  const _$DeckInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DeckState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeckInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(List<Deck> decks),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(List<Deck> decks),
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
    @required Result initial(DeckInitial value),
    @required Result loading(DeckLoadInProgress value),
    @required Result success(DeckLoadSuccess value),
    @required Result error(DeckErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(DeckInitial value),
    Result loading(DeckLoadInProgress value),
    Result success(DeckLoadSuccess value),
    Result error(DeckErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DeckInitial implements DeckState {
  const factory DeckInitial() = _$DeckInitial;
}

/// @nodoc
abstract class $DeckLoadInProgressCopyWith<$Res> {
  factory $DeckLoadInProgressCopyWith(
          DeckLoadInProgress value, $Res Function(DeckLoadInProgress) then) =
      _$DeckLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckLoadInProgressCopyWithImpl<$Res>
    extends _$DeckStateCopyWithImpl<$Res>
    implements $DeckLoadInProgressCopyWith<$Res> {
  _$DeckLoadInProgressCopyWithImpl(
      DeckLoadInProgress _value, $Res Function(DeckLoadInProgress) _then)
      : super(_value, (v) => _then(v as DeckLoadInProgress));

  @override
  DeckLoadInProgress get _value => super._value as DeckLoadInProgress;
}

/// @nodoc
class _$DeckLoadInProgress
    with DiagnosticableTreeMixin
    implements DeckLoadInProgress {
  const _$DeckLoadInProgress();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DeckState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeckLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(List<Deck> decks),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(List<Deck> decks),
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
    @required Result initial(DeckInitial value),
    @required Result loading(DeckLoadInProgress value),
    @required Result success(DeckLoadSuccess value),
    @required Result error(DeckErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(DeckInitial value),
    Result loading(DeckLoadInProgress value),
    Result success(DeckLoadSuccess value),
    Result error(DeckErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeckLoadInProgress implements DeckState {
  const factory DeckLoadInProgress() = _$DeckLoadInProgress;
}

/// @nodoc
abstract class $DeckLoadSuccessCopyWith<$Res> {
  factory $DeckLoadSuccessCopyWith(
          DeckLoadSuccess value, $Res Function(DeckLoadSuccess) then) =
      _$DeckLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Deck> decks});
}

/// @nodoc
class _$DeckLoadSuccessCopyWithImpl<$Res> extends _$DeckStateCopyWithImpl<$Res>
    implements $DeckLoadSuccessCopyWith<$Res> {
  _$DeckLoadSuccessCopyWithImpl(
      DeckLoadSuccess _value, $Res Function(DeckLoadSuccess) _then)
      : super(_value, (v) => _then(v as DeckLoadSuccess));

  @override
  DeckLoadSuccess get _value => super._value as DeckLoadSuccess;

  @override
  $Res call({
    Object decks = freezed,
  }) {
    return _then(DeckLoadSuccess(
      decks: decks == freezed ? _value.decks : decks as List<Deck>,
    ));
  }
}

/// @nodoc
class _$DeckLoadSuccess
    with DiagnosticableTreeMixin
    implements DeckLoadSuccess {
  const _$DeckLoadSuccess({@required this.decks}) : assert(decks != null);

  @override
  final List<Deck> decks;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckState.success(decks: $decks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeckState.success'))
      ..add(DiagnosticsProperty('decks', decks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckLoadSuccess &&
            (identical(other.decks, decks) ||
                const DeepCollectionEquality().equals(other.decks, decks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(decks);

  @override
  $DeckLoadSuccessCopyWith<DeckLoadSuccess> get copyWith =>
      _$DeckLoadSuccessCopyWithImpl<DeckLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(List<Deck> decks),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(decks);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(List<Deck> decks),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(decks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(DeckInitial value),
    @required Result loading(DeckLoadInProgress value),
    @required Result success(DeckLoadSuccess value),
    @required Result error(DeckErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(DeckInitial value),
    Result loading(DeckLoadInProgress value),
    Result success(DeckLoadSuccess value),
    Result error(DeckErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DeckLoadSuccess implements DeckState {
  const factory DeckLoadSuccess({@required List<Deck> decks}) =
      _$DeckLoadSuccess;

  List<Deck> get decks;
  $DeckLoadSuccessCopyWith<DeckLoadSuccess> get copyWith;
}

/// @nodoc
abstract class $DeckErrorStateCopyWith<$Res> {
  factory $DeckErrorStateCopyWith(
          DeckErrorState value, $Res Function(DeckErrorState) then) =
      _$DeckErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$DeckErrorStateCopyWithImpl<$Res> extends _$DeckStateCopyWithImpl<$Res>
    implements $DeckErrorStateCopyWith<$Res> {
  _$DeckErrorStateCopyWithImpl(
      DeckErrorState _value, $Res Function(DeckErrorState) _then)
      : super(_value, (v) => _then(v as DeckErrorState));

  @override
  DeckErrorState get _value => super._value as DeckErrorState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(DeckErrorState(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$DeckErrorState with DiagnosticableTreeMixin implements DeckErrorState {
  const _$DeckErrorState({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeckState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeckState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $DeckErrorStateCopyWith<DeckErrorState> get copyWith =>
      _$DeckErrorStateCopyWithImpl<DeckErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result success(List<Deck> decks),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(List<Deck> decks),
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
    @required Result initial(DeckInitial value),
    @required Result loading(DeckLoadInProgress value),
    @required Result success(DeckLoadSuccess value),
    @required Result error(DeckErrorState value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(DeckInitial value),
    Result loading(DeckLoadInProgress value),
    Result success(DeckLoadSuccess value),
    Result error(DeckErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeckErrorState implements DeckState {
  const factory DeckErrorState({@required String message}) = _$DeckErrorState;

  String get message;
  $DeckErrorStateCopyWith<DeckErrorState> get copyWith;
}
