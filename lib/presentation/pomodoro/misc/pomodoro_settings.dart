import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:study_buddy/domain/deck/deck.dart';

class PomodoroSettings {
  final int pomodoro;
  final int shortBreak;
  final int longBreak;
  final Option<Deck> deckOption;

  PomodoroSettings({
    @required this.pomodoro,
    @required this.shortBreak,
    @required this.longBreak,
    @required this.deckOption,
  })  : assert(pomodoro != null),
        assert(shortBreak != null),
        assert(longBreak != null),
        assert(deckOption != null);

  factory PomodoroSettings.initial() {
    return PomodoroSettings(
        pomodoro: 1, shortBreak: 10, longBreak: 15, deckOption: none());
  }
}

final pomodoroSettingsProvider = StateProvider.autoDispose<PomodoroSettings>(
    (ref) => PomodoroSettings.initial());

class ChosenDeck {
  Deck _deck;
  Deck get deck => _deck;
  set deck(val) => _deck = val;
}
