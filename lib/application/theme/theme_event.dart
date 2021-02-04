part of 'theme_bloc.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.changed({@required AppTheme appTheme}) =
      _ThemeChanged;
}
