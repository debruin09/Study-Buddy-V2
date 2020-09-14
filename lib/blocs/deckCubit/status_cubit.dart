import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'status_state.dart';

class DeckStatusCubit extends Cubit<String> {
  DeckStatusCubit() : super("");

  void changeDeckStatus(String status) => emit(status);
}

class CardStatusCubit extends Cubit<String> {
  CardStatusCubit() : super("");

  void changeCardStatus(String status) => emit(status);
}
