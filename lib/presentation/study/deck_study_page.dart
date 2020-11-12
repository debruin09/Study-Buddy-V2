import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:study_buddy/application/card/card_bloc.dart';
import 'package:study_buddy/application/core/speech/speech_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/application/deck/deck_bloc.dart';
import 'package:study_buddy/application/similarity/similarity_bloc.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:study_buddy/domain/core/scheduler/queue_scheduler.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/study/widgets/study.dart';

final showRecordingProvider = StateProvider.autoDispose((ref) => false);
final isListeningProvider = StateProvider.autoDispose((ref) => false);
final showSimilarityProvider = StateProvider.autoDispose((ref) => false);
final showAnswerProvider = StateProvider.autoDispose((ref) => false);
final saveDefinitionProvider = StateProvider.autoDispose((ref) => "");

class DeckStudyPage extends StatefulWidget {
  final Deck deck;
  const DeckStudyPage({Key key, @required this.deck}) : super(key: key);
  @override
  _DeckStudyPageState createState() => _DeckStudyPageState();
}

class _DeckStudyPageState extends State<DeckStudyPage> {
  final _notification = locator.get<LocalNotificationRepository>();
  final _deckBloc = locator.get<DeckBloc>();
  final _cardBloc = locator.get<CardBloc>();
  final _cardStatusCubit = locator.get<CardStatusCubit>();
  final _simBloc = locator.get<SimilarityBloc>();
  final deckStatusCubit = locator.get<DeckStatusCubit>();

  final _speechBloc = locator.get<SpeechBloc>();
  stt.SpeechToText _speech;

  @override
  void initState() {
    _speech = stt.SpeechToText();
    _cardBloc.add(LoadCards());
    _notification.initializing();

    super.initState();
  }

  @override
  void dispose() {
    _deckBloc.close();
    _cardBloc.close();
    _simBloc.close();
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
              BuildContextX(context).read(showRecordingProvider).state = true;
            } else if (choice == Choices.edit) {
              _cardStatusCubit.editCard();
              ExtendedNavigator.root.push(Routes.createNewDeckPage,
                  arguments: CreateNewDeckPageArguments(
                    deck: widget.deck,
                  ));
              ReadContext(context).read<DeckStatusCubit>().editDeck();
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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                  child: BodyWrapper(
                cardBloc: _cardBloc,
                speechBloc: _speechBloc,
                highlights: _highlights,
              )),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              flex: 2,
              child: BottomWrapper(
                notification: _notification,
                simBloc: _simBloc,
              ),
            ),
          ]),
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

  Future<void> _promptSaving(BuildContext context) async {
    final cardToBeUpdated = locator.get<QueueScheduler>().q1.first;
    final updatedCard = cardToBeUpdated.copyWith(
        me: BuildContextX(context).read(saveDefinitionProvider).state);

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Do you want to save your definition?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    _cardBloc.add(
                      CardEvent.update(
                        updatedCard: updatedCard,
                      ),
                    );
                    BuildContextX(context).read(isListeningProvider).state =
                        false;
                    ExtendedNavigator.root.pop();
                  },
                  child: Text(
                    "yes",
                    style: TextStyle(color: Colors.black),
                  )),
              FlatButton(
                  onPressed: () {
                    ExtendedNavigator.root.pop();
                    BuildContextX(context).read(isListeningProvider).state =
                        false;
                  },
                  child: Text(
                    "no",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          );
        });
  }

  void _listen() async {
    if (!BuildContextX(context).read(isListeningProvider).state) {
      final available = await _speech.initialize(
        debugLogging: true,
        onStatus: (val) => print("OnStatus: $val"),
        onError: (val) {
          print('onError: $val');
          _speechBloc
              .add(SpeechEvent.error(errorMessage: "No internet connection."));
          BuildContextX(context).read(isListeningProvider).state = false;
          _speech.stop();
        },
      );

      if (available) {
        BuildContextX(context).read(isListeningProvider).state = true;
        _speech.listen(
          listenFor: Duration(seconds: 15),
          onResult: (res) {
            _speechBloc.add(SpeechEvent.onChange(text: res.recognizedWords));

            if (res.hasConfidenceRating && res.confidence > 0) {
              final confidence = res.confidence;
              print("This is the confidence level: ${confidence * 100}%");
              // After the recording is done show the similarity button

              BuildContextX(context).read(saveDefinitionProvider).state =
                  res.recognizedWords;
              _promptSaving(context);
              BuildContextX(context).read(showSimilarityProvider).state = true;
            }
          },
        );
      }
    } else {
      BuildContextX(context).read(isListeningProvider).state = false;
      _speech.stop();
    }
  }

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
}

enum Choices {
  record,
  edit,
}

class BottomWrapper extends ConsumerWidget {
  final SimilarityBloc simBloc;
  final LocalNotificationRepository notification;

  const BottomWrapper({
    Key key,
    @required this.simBloc,
    @required this.notification,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final showRecorder = watch(showRecordingProvider).state;
    final listening = watch(isListeningProvider).state;
    return !showRecorder
        ? Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SimilarityWrapper(
                    simBloc: simBloc,
                  ),
                ),
                TimeIntervalWidget(
                  notificationRepository: notification,
                ),
              ],
            ),
          )
        : listening
            ? Container()
            : GestureDetector(
                onTap: () {
                  BuildContextX(context).read(showRecordingProvider).state =
                      false;
                },
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              );
  }
}
