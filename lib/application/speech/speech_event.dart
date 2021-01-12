part of 'speech_bloc.dart';

@freezed
abstract class SpeechEvent with _$SpeechEvent {
  const factory SpeechEvent.onChange({@required String text}) = _OnChange;
  const factory SpeechEvent.error({@required String errorMessage}) =
      _SpeechEventError;
  const factory SpeechEvent.getFromDatabase() = _GetFromDatabase;
}
