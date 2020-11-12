import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_watcher_event.dart';
part 'field_watcher_state.dart';
part 'field_watcher_bloc.freezed.dart';

class FieldWatcherBloc extends Bloc<FieldWatcherEvent, FieldWatcherState> {
  FieldWatcherBloc() : super(_Initial());

  @override
  Stream<FieldWatcherState> mapEventToState(
    FieldWatcherEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
