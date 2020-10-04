import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'status_state.dart';

@injectable
class DeckStatusCubit extends Cubit<StatusState> {
  DeckStatusCubit() : super(NewDeckState());

  void newDeck() => emit(NewDeckState());
  void editDeck() => emit(EditDeckState());
}

class CardStatusCubit extends Cubit<String> {
  CardStatusCubit() : super("");

  void changeCardStatus(String status) => emit(status);
}
