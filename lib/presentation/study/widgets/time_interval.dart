// TimeIntervalWidget
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/application/notificatoin/notification_bloc.dart';
import 'package:study_buddy/application/speech/speech_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/presentation/study/misc/providers.dart';
import 'package:study_buddy/presentation/study/misc/helper_functions.dart';
import 'package:study_buddy/presentation/study/widgets/record_button.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval_difficulty.dart';

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
              listen(context, speechBloc, speechToText, formProvider, formBloc,
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

                          ReadContext(context).read<NotificationBloc>().add(
                                NotificationEvent.hardNotifier(
                                  deck: formBloc.state.deck,
                                  cards: formProvider.value,
                                ),
                              );

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
