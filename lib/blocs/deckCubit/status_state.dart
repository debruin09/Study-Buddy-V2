part of 'status_cubit.dart';

abstract class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

class NewDeckState extends StatusState {}

class EditDeckState extends StatusState {}

class NewCardState extends StatusState {}

class EditCardState extends StatusState {}
