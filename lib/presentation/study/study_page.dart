import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';

import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/study/widgets/study_page_body.dart';

class StudyPage extends StatelessWidget {
  final Deck deck;
  const StudyPage({
    Key key,
    @required this.deck,
  })  : assert(deck != null),
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
          create: (context) => locator<DeckWatcherBloc>()
            ..add(
              const DeckWatcherEvent.watchUnstudiedStarted(),
            ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(deck.name.getOrCrash()),
          actions: [
            _popupMenuButton(context, deck),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: StudyPageBody(deck: deck),
        ),
      ),
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
        ];
      },
      child: Icon(Icons.more_vert),
    ),
  );
}

enum StudyOptions { edit, record, studiedCards }
