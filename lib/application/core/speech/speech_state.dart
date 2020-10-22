part of 'speech_bloc.dart';

@freezed
abstract class SpeechState with _$SpeechState {
  const factory SpeechState.initial({@required SpeechEntity speechEntity}) =
      _Initial;
  const factory SpeechState.isListening({@required SpeechEntity speechEntity}) =
      _IsListening;
}
