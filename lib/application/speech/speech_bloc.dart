import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/core/speech/speech_entity.dart';

part 'speech_event.dart';
part 'speech_state.dart';
part 'speech_bloc.freezed.dart';

class SpeechBloc extends Bloc<SpeechEvent, SpeechState> {
  SpeechBloc()
      : super(SpeechState.initial(
            speechEntity:
                SpeechEntity(isListening: false, text: "Press record")));

  @override
  Stream<SpeechState> mapEventToState(
    SpeechEvent event,
  ) async* {
    yield* event.map(
      onChange: (_OnChange value) async* {
        yield state.copyWith(
          speechEntity: SpeechEntity(
            isListening: true,
            text: value.text,
          ),
        );
      },
      error: (_SpeechEventError value) async* {
        print("SPEECH BLOC ERROR: { ${value.errorMessage} }");
      },
    );
    //  error: (_SpeechEventError value) async* {
    //   print("SPEECH BLOC ERROR: { ${value.errorMessage} }");
    //   yield SpeechState.error(errorMessage: "No internet connection found");
  }
}
