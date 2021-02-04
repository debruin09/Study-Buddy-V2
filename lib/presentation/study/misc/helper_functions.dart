import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/injection.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/application/speech/speech_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:study_buddy/presentation/study/misc/providers.dart';
import 'package:hooks_riverpod/all.dart';

KtList<CardItemPrimitive> markCardAsStudied(
    {@required FormCards formProvider,
    @required KtList<CardItemPrimitive> unstudiedCards,
    @required Color color}) {
  final cardToBeUpdated =
      formProvider.value.firstOrNull((prim) => prim == unstudiedCards.first());
  final updatedCard =
      cardToBeUpdated.copyWith(studied: true, color: color.value);
  final modifiableList = formProvider.value.iter.toList();
  modifiableList.remove(cardToBeUpdated);
  modifiableList.add(updatedCard);

  return modifiableList.toImmutableList();
}

KtList<CardItemPrimitive> updateCardWithMyDefinition(
    {@required FormCards formProvider,
    @required KtList<CardItemPrimitive> unstudiedCards,
    @required String recordedText}) {
  final cardToBeUpdated =
      formProvider.value.firstOrNull((prim) => prim == unstudiedCards.first());
  final updatedCard = cardToBeUpdated.copyWith(me: recordedText);
  final modifiableList = formProvider.value.iter.toList();
  modifiableList.remove(cardToBeUpdated);
  modifiableList.add(updatedCard);

  return modifiableList.toImmutableList();
}

Future<void> promptSaving(BuildContext context, FormCards formProvider,
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

void listen(context, SpeechBloc speechBloc, stt.SpeechToText speech,
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
            promptSaving(context, formProvider, res.recognizedWords, formBloc,
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
