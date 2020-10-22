import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/application/deck/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/speech/speech_page.dart';
import 'package:study_buddy/presentation/study/widgets/folding_cell_card_wrapper.dart';
import 'package:study_buddy/presentation/study/widgets/similarity_wrapper.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:study_buddy/application/core/speech/speech_bloc.dart';
import 'package:highlight_text/highlight_text.dart';

final showRecordingProvider = StateProvider((ref) => false);

class DeckStudyPage extends StatefulWidget {
  final Deck deck;
  const DeckStudyPage({
    Key key,
    @required this.deck,
  }) : super(key: key);
  @override
  _DeckStudyPageState createState() => _DeckStudyPageState();
}

class _DeckStudyPageState extends State<DeckStudyPage> {
  final notification = locator.get<LocalNotificationRepository>();
  final deckBloc = locator.get<DeckBloc>();
  final cardBloc = locator.get<CardBloc>();
  final cardStatusCubit = locator.get<CardStatusCubit>();

  final _speechBloc = locator.get<SpeechBloc>();
  stt.SpeechToText _speech;

  final Map<String, HighlightedWord> _highlights = {
    'database': HighlightedWord(
      onTap: () {},
      textStyle: const TextStyle(
        color: Colors.greenAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'test': HighlightedWord(
      onTap: () {},
      textStyle: const TextStyle(
        color: Colors.greenAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'aws': HighlightedWord(
      onTap: () {},
      textStyle: const TextStyle(
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  @override
  void initState() {
    _speech = stt.SpeechToText();
    cardBloc.add(LoadCards());
    notification.initializing();
    super.initState();
  }

  @override
  void dispose() {
    deckBloc.close();
    cardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          "${widget.deck.deckName}",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<Choices>(onSelected: (choice) {
            if (choice == Choices.record) {
              context.read(showRecordingProvider).state = true;
            } else if (choice == Choices.edit) {
              cardStatusCubit.changeCardStatus("edit");
              ExtendedNavigator.root.push(Routes.createNewCardPage,
                  arguments: CreateNewCardPageArguments(
                    card: context.read(queueProvider).first,
                  ));
              context
                  .read(queueProvider)
                  .remove(context.read(queueProvider).first);
            }
          }, itemBuilder: (context) {
            return Choices.values.map((choice) {
              return PopupMenuItem<Choices>(
                value: choice,
                child: Text(
                  choice.toString().substring(8),
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList();
          })
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FoldingCellCardWrapper(
                cardBloc: cardBloc,
                speechBloc: _speechBloc,
                highlights: _highlights,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Consumer(
              builder: (context, watch, child) {
                final showRecorder = watch(showRecordingProvider).state;
                return !showRecorder
                    ? Container(
                        child: Column(
                          children: [
                            SimilarityWrapper(),
                            TimeIntervalWidget(
                              notificationRepository: notification,
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          context.read(showRecordingProvider).state = false;
                        },
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 100.0,
                        ),
                      );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Consumer(
        builder: (context, watch, child) {
          final showRecorder = watch(showRecordingProvider).state;
          return showRecorder
              ? RecordButton(
                  listen: _listen,
                )
              : Container();
        },
      ),
    );
  }

  void _listen() async {
    if (!context.read(isListeningProvider).state) {
      final available = await _speech.initialize(
        debugLogging: true,
        onStatus: (val) => print("OnStatus: $val"),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        context.read(isListeningProvider).state = true;

        _speech.listen(
            listenFor: Duration(seconds: 6),
            onResult: (res) {
              _speechBloc.add(SpeechEvent.onChange(text: res.recognizedWords));
              if (res.hasConfidenceRating && res.confidence > 0) {
                final confidence = res.confidence;
                print("This is the confidence level: ${confidence * 100}%");
              }
            });
      }
    } else {
      context.read(isListeningProvider).state = false;
      _speech.stop();
    }
  }
}

enum Choices {
  record,
  edit,
}
