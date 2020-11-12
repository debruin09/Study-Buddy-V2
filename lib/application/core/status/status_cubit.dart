import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_state.dart';
part 'status_cubit.freezed.dart';

class DeckStatusCubit extends Cubit<DeckStatusState> {
  DeckStatusCubit() : super(DeckStatusState.newDeck());

  void newDeck() => emit(DeckStatusState.newDeck());
  void editDeck() => emit(DeckStatusState.editDeck());
}

class CardStatusCubit extends Cubit<CardStatusState> {
  CardStatusCubit() : super(CardStatusState.newCard());

  void newCard() => emit(CardStatusState.newCard());
  void editCard() => emit(CardStatusState.editCard());
}
