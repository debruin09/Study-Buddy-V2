import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/application/notificatoin/notification_bloc.dart';
import 'package:study_buddy/application/speech/speech_bloc.dart';

import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
// import 'package:study_buddy/presentation/pomodoro/widgets/pomodoro_clock.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/study/misc/providers.dart';
import 'package:study_buddy/presentation/study/widgets/study_page_body.dart';

class StudyPage extends StatelessWidget {
  final Deck deck;
  final bool withPomodoro;
  StudyPage({Key key, @required this.deck, @required this.withPomodoro})
      : assert(deck != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<DeckFormBloc>()
            ..add(
              DeckFormEvent.initialized(optionOf(deck)),
            ),
        ),
        BlocProvider(
          create: (context) => locator<NotificationBloc>()
            ..add(
              const NotificationEvent.initialize(),
            ),
        ),
        BlocProvider(
          create: (context) => locator<DeckWatcherBloc>()
            ..add(
              const DeckWatcherEvent.watchUnstudiedStarted(),
            ),
        ),
        BlocProvider(
            create: (context) => locator<SpeechBloc>()
              ..add(const SpeechEvent.getFromDatabase())),
      ],
      child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text(deck.name.getOrCrash()),
            actions: [
              _popupMenuButton(context, deck),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child:
                        StudyPageBody(deck: deck, withPomodoro: withPomodoro)),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked),
    );
  }
}

Widget _popupMenuButton(context, Deck deck) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: PopupMenuButton<StudyOptions>(
      onSelected: (StudyOptions res) {
        if (res == StudyOptions.edit)
          ExtendedNavigator.root.pushDeckFormPage(deck: deck);
        else if (res == StudyOptions.studiedCards)
          ExtendedNavigator.root.pushStudiedCardsPage();
        else if (res == StudyOptions.record)
          BuildContextX(context).read(showRecordProvider).state = true;
        else if (res == StudyOptions.pomodoro)
          ExtendedNavigator.root.pushPomodoroPage();
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<StudyOptions>>[
          const PopupMenuItem<StudyOptions>(
            value: StudyOptions.edit,
            child: Text("edit"),
          ),
          const PopupMenuItem<StudyOptions>(
            value: StudyOptions.record,
            child: Text("record"),
          ),
          const PopupMenuItem<StudyOptions>(
            value: StudyOptions.studiedCards,
            child: Text("studied cards"),
          ),
          const PopupMenuItem<StudyOptions>(
            value: StudyOptions.pomodoro,
            child: Text("pomodoro"),
          ),
        ];
      },
      child: Icon(Icons.more_vert),
    ),
  );
}

enum StudyOptions { edit, record, studiedCards, pomodoro }

//   final Map<String, HighlightedWord> _highlights = {
//     'database': HighlightedWord(
//       onTap: () {},
//       textStyle: const TextStyle(
//         color: Colors.greenAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'test': HighlightedWord(
//       onTap: () {},
//       textStyle: const TextStyle(
//         color: Colors.greenAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'aws': HighlightedWord(
//       onTap: () {},
//       textStyle: const TextStyle(
//         color: Colors.redAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   };
// }
