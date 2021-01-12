// TimeIntervalWidget
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/application/notificatoin/notification_bloc.dart';
import 'package:study_buddy/application/speech/speech_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/presentation/study/misc/providers.dart';
import 'package:study_buddy/presentation/study/misc/studied_deck_function.dart';
import 'package:study_buddy/presentation/study/widgets/record_button.dart';

class TimeIntervalWidget extends ConsumerWidget {
  final Deck deck;
  TimeIntervalWidget({
    Key key,
    @required this.deck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isShowAnswer = watch(showAnswerProvider).state;
    final formProvider = watch(formCardsProvider);
    final unstudiedCards = watch(unstudiedCardsProvider);
    final isRecording = watch(showRecordProvider).state;
    final formBloc = context.watch<DeckFormBloc>();
    final speechBloc = context.watch<SpeechBloc>();
    final speechToText = watch(speechToTextProvider);
    return isRecording
        ? RecordButton(
            listen: () {
              BuildContextX(context).read(showAnswerProvider).state = true;
              _listen(context, speechBloc, speechToText, formProvider, formBloc,
                  unstudiedCards);
            },
          )
        : !isShowAnswer
            ? const ShowAnswerButton()
            : Card(
                elevation: 2.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Difficulty(
                        icon: Icons.thumb_down,
                        label: "bad",
                        pressed: () {
                          formProvider.value = markCardAsStudied(
                              formProvider: formProvider,
                              unstudiedCards: unstudiedCards,
                              color: Colors.red);

                          ReadContext(context).read<DeckFormBloc>()
                            ..add(DeckFormEvent.hardCardChange())
                            ..add(
                              DeckFormEvent.cardsChanged(formProvider.value),
                            );

                          ReadContext(context)
                              .read<NotificationBloc>()
                              .add(NotificationEvent.hardNotifier(
                                deck: formBloc.state.deck,
                                cards: formProvider.value,
                              ));

                          print("CARDS : ${formProvider.value}");

                          BuildContextX(context)
                              .read(showAnswerProvider)
                              .state = false;
                        },
                      ),
                    ),
                    Expanded(
                      child: Difficulty(
                        label: "moderate",
                        icon: Icons.star_half,
                        pressed: () {
                          formProvider.value = markCardAsStudied(
                              formProvider: formProvider,
                              unstudiedCards: unstudiedCards,
                              color: Colors.blueAccent);

                          ReadContext(context).read<DeckFormBloc>()
                            ..add(DeckFormEvent.moderateCardChange())
                            ..add(
                              DeckFormEvent.cardsChanged(formProvider.value),
                            );
                          ReadContext(context)
                              .read<NotificationBloc>()
                              .add(NotificationEvent.moderateNotifier(
                                deck: formBloc.state.deck,
                                cards: formProvider.value,
                              ));

                          ReadContext(context).read<DeckFormBloc>()
                            ..add(DeckFormEvent.moderateCardChange())
                            ..add(
                              DeckFormEvent.cardsChanged(formProvider.value),
                            );

                          BuildContextX(context)
                              .read(showAnswerProvider)
                              .state = false;
                        },
                      ),
                    ),
                    Expanded(
                      child: Difficulty(
                        icon: Icons.thumb_up,
                        label: "good",
                        pressed: () {
                          formProvider.value = markCardAsStudied(
                              formProvider: formProvider,
                              unstudiedCards: unstudiedCards,
                              color: Colors.green);

                          ReadContext(context).read<DeckFormBloc>()
                            ..add(DeckFormEvent.easyCardChange())
                            ..add(
                              DeckFormEvent.cardsChanged(formProvider.value),
                            );

                          ReadContext(context)
                              .read<NotificationBloc>()
                              .add(NotificationEvent.easyNotifier(
                                deck: formBloc.state.deck,
                                cards: formProvider.value,
                              ));

                          ReadContext(context).read<DeckFormBloc>()
                            ..add(DeckFormEvent.easyCardChange())
                            ..add(
                              DeckFormEvent.cardsChanged(formProvider.value),
                            );

                          BuildContextX(context)
                              .read(showAnswerProvider)
                              .state = false;
                        },
                      ),
                    ),
                  ],
                ));
  }
}

void _listen(context, SpeechBloc speechBloc, stt.SpeechToText speech,
    FormCards formProvider, formBloc, unstudiedCards) async {
  if (!BuildContextX(context).read(isListeningProvider).state) {
    final available = await speech.initialize(
      debugLogging: true,
      onStatus: (val) => print("OnStatus: $val"),
      onError: (val) {
        print('onError: $val');
        speechBloc
            .add(SpeechEvent.error(errorMessage: "No internet connection."));
        BuildContextX(context).read(isListeningProvider).state = false;
        speech.stop();
      },
    );

    if (available) {
      BuildContextX(context).read(isListeningProvider).state = true;
      speech.listen(
        listenFor: Duration(seconds: 15),
        onResult: (res) {
          speechBloc.add(SpeechEvent.onChange(text: res.recognizedWords));

          if (res.hasConfidenceRating && res.confidence > 0) {
            final confidence = res.confidence;
            print("This is the confidence level: ${confidence * 100}%");
            // After the recording is done show the similarity button
            BuildContextX(context).read(isListeningProvider).state = false;
            // Prompt the user to save the current definition

            // BuildContextX(context).read(saveDefinitionProvider).state =
            //     res.recognizedWords;
            _promptSaving(context, formProvider, res.recognizedWords, formBloc,
                unstudiedCards);
            // BuildContextX(context).read(showSimilarityProvider).state = true;

            //! After the recording i should add the recorded text to the deckFormBloc
            //! or the formCardsProvider, then uodate the formBloc with cardsChange eveny
            //! then add the SpeechEvent.getFromDatabase event to show the saved value
          }
        },
      );
    }
  } else {
    BuildContextX(context).read(isListeningProvider).state = false;
    speech.stop();
  }
}

Future<void> _promptSaving(BuildContext context, FormCards formProvider,
    String recordedText, DeckFormBloc formBloc, unstudiedCards) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do you want to save your definition?"),
          actions: [
            FlatButton(
                onPressed: () {
                  final formCards = updateCardWithMyDefinition(
                      formProvider: formProvider,
                      unstudiedCards: unstudiedCards,
                      recordedText: recordedText);
                  formBloc
                    ..add(DeckFormEvent.cardsChanged(formCards))
                    ..add(const DeckFormEvent.saved());

                  locator.get<SpeechBloc>().add(SpeechEvent.getFromDatabase());

                  // save the text to the formBloc
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

class Difficulty extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function pressed;

  const Difficulty({
    Key key,
    this.icon,
    this.label,
    this.pressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: pressed,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            "$label",
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
          Icon(
            icon,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

extension DeckFormBlocX on BuildContext {
  DeckFormBloc get form => ReadContext(this).read<DeckFormBloc>();
}

class ShowAnswerButton extends StatelessWidget {
  const ShowAnswerButton();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: MaterialButton(
        color: Colors.white,
        onPressed: () =>
            BuildContextX(context).read(showAnswerProvider).state = true,
        child: Text(
          "SHOW ANSWER(S)",
          style: TextStyle(fontSize: 16.0, color: primaryColor),
        ),
        minWidth: double.infinity,
      ),
    );
  }
}
