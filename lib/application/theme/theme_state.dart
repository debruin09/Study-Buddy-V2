part of 'theme_bloc.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.initial({@required ThemeData themeData}) = _Initial;
}
