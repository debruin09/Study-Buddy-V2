part of 'speech_bloc.dart';

@freezed
abstract class SpeechEvent with _$SpeechEvent {
  const factory SpeechEvent.onChange({@required String text}) = _OnChange;
}
