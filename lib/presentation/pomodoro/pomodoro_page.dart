import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';

import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/widgets/critical_failure_display.dart';
import 'package:study_buddy/presentation/pomodoro/misc/pomodoro_settings.dart';
import 'package:study_buddy/presentation/pomodoro/widgets/pomodoro_field.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

final isCheckedProvider = StateProvider.autoDispose((ref) => false);

class PomodoroPage extends ConsumerWidget {
  final pomodoroController = TextEditingController();
  final shortBreakController = TextEditingController();
  final longBreakController = TextEditingController();
  final _chosenDeck = locator<ChosenDeck>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _isChecked = watch(isCheckedProvider);

    return BlocProvider(
      create: (context) => locator<DeckWatcherBloc>()
        ..add(
          const DeckWatcherEvent.watchAllStarted(),
        ),
      child: BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => Loader(color: primaryColor),
              loadFailure: (state) =>
                  CriticalFailureDisplay(failure: state.deckFailure),
              loadSuccess: (state) {
                _chosenDeck.deck = state.decks.firstOrNull();

                return Scaffold(
                  appBar: AppBar(
                    brightness: Brightness.dark,
                    title: Text(
                      "Pomodoro",
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: _chosenDeck.deck == null
                          ? Center(
                              child: Container(
                              child: Text(
                                "No decks",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ))
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Create a session",
                                  style: TextStyle(fontSize: 23.0),
                                ),
                                const SizedBox(height: 20.0),
                                Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Choose your deck",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      const SizedBox(height: 10.0),
                                      InputDecorator(
                                        decoration: InputDecoration(
                                          labelStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .caption
                                              .copyWith(color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  style: BorderStyle.solid)),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            isDense:
                                                true, // Reduces the dropdowns height by +/- 50%
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            value: _chosenDeck.deck,
                                            items: state.decks.iter
                                                .map<DropdownMenuItem<Deck>>(
                                                    (Deck deck) {
                                              return DropdownMenuItem<Deck>(
                                                value: deck,
                                                child: Text(
                                                    deck.name.getOrCrash()),
                                              );
                                            }).toList(),
                                            onChanged: (Deck selectedDeck) =>
                                                _chosenDeck.deck = selectedDeck,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                const SizedBox(height: 10.0),
                                Card(
                                  child: ListTile(
                                    title: Text('Use without a deck'),
                                    onTap: () {
                                      ExtendedNavigator.root
                                          .pushPomodoroClockPage();
                                      ExtendedNavigator.root.pop();
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      PomodoroField(
                                        text: "Pomodoro",
                                        subtext: "1 pomodoro = 25 minutes",
                                        controller: pomodoroController,
                                      ),
                                      const SizedBox(height: 10.0),
                                      PomodoroField(
                                        text: "Short Break",
                                        subtext: "min",
                                        controller: shortBreakController,
                                      ),
                                      const SizedBox(height: 10.0),
                                      PomodoroField(
                                        text: "Long Break",
                                        subtext: "min",
                                        controller: longBreakController,
                                      ),
                                    ],
                                  ),
                                )),
                                const SizedBox(height: 20.0),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  child: Text(
                                    "Start the session",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                  ),
                                  onPressed: () {
                                    if (!_isChecked.state) {
                                      BuildContextX(context)
                                          .read(pomodoroSettingsProvider)
                                          .state = new PomodoroSettings(
                                        pomodoro:
                                            int.parse(pomodoroController.text),
                                        shortBreak: int.parse(
                                            shortBreakController.text),
                                        longBreak:
                                            int.parse(longBreakController.text),
                                        deckOption: !_isChecked.state
                                            ? some(_chosenDeck.deck)
                                            : none(),
                                      );

                                      ExtendedNavigator.root.pushStudyPage(
                                          deck: _chosenDeck.deck,
                                          withPomodoro: true);
                                    }

                                    ExtendedNavigator.root.popUntil((route) =>
                                        route.settings.name == Routes.homePage);
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey),
                                  ),
                                  child: Text("How does this work ?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 14.0)),
                                  onPressed: () => _pomodoroDefDialog(context),
                                ),
                              ],
                            ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

Future<void> _pomodoroDefDialog(context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text("What is pomodoro"),
          content: SingleChildScrollView(
              child: Text(
                  "This is some definition of pomodoro blah blah blah...")),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "I understand",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        );
      });
}
