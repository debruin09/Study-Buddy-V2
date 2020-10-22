import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'status_state.dart';

class DeckStatusCubit extends Cubit<StatusState> {
  DeckStatusCubit() : super(NewDeckState());

  void newDeck() => emit(NewDeckState());
  void editDeck() => emit(EditDeckState());
}

class CardStatusCubit extends Cubit<String> {
  CardStatusCubit() : super("");

  void changeCardStatus(String status) => emit(status);
}
