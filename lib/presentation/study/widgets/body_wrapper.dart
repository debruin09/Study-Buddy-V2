import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/card/card_bloc.dart';
import 'package:study_buddy/domain/core/scheduler/queue_scheduler.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/study/core/draggable_card.dart';
import 'package:study_buddy/presentation/study/core/draggable_speech_card.dart';
import 'package:study_buddy/presentation/study/deck_study_page.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:study_buddy/application/core/speech/speech_bloc.dart';

class BodyWrapper extends ConsumerWidget {
  final CardBloc cardBloc;
  final SpeechBloc speechBloc;
  final Map<String, HighlightedWord> highlights;
  final queueScheduler = locator.get<QueueScheduler>();

  BodyWrapper(
      {Key key, @required this.cardBloc, this.speechBloc, this.highlights})
      : super(key: key);
  @override
  Widget build(BuildContext contexth, ScopedReader watch) {
    final showAnswer = watch(showAnswerProvider).state;
    final listening = watch(isListeningProvider).state;
    final queue = queueScheduler.q1;

    return BlocBuilder<CardBloc, CardState>(
      buildWhen: (p, c) => p != c,
      cubit: cardBloc,
      builder: (context, state) {
        return state.map(
          initial: (_) => Loader(
            color: primaryColor,
          ),
          loading: (_) => Loader(
            color: primaryColor,
          ),
          success: (state) {
            if (queueScheduler.lengthAfterPopulation ==
                queueScheduler.q2.length) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Deck completed"),
                    SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        text: "hard: ${queueScheduler.hard}  ",
                        style: TextStyle(color: Colors.red),
                        children: [
                          TextSpan(
                            text: "moderate: ${queueScheduler.moderate}  ",
                            style: TextStyle(color: Colors.yellow),
                          ),
                          TextSpan(
                            text: "easy: ${queueScheduler.easy}  ",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            state.cards.first.front,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${queueScheduler.hard}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              Text(
                                "${queueScheduler.moderate}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow),
                              ),
                              Text(
                                "${queueScheduler.easy}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Container(
                                width: 5.0,
                                height: 20.0,
                                margin: const EdgeInsets.only(right: 3.0),
                                child: VerticalDivider(
                                  thickness: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text("${queueScheduler.q1.length} left"),
                            ],
                          ),
                        ),
                      ]),
                ),
                showAnswer
                    ? DraggableCard(
                        cardBloc: cardBloc,
                        initialSize: 0.9,
                        minSize: 0.9,
                        card: queue.first,
                        text: queue.first.back,
                      )
                    : Container(),
                listening ? Divider() : Container(),
                queue.first.me != null && !listening
                    ? DraggableCard(
                        cardBloc: cardBloc,
                        initialSize: 0.7,
                        card: queue.first,
                        text: queue.first.me,
                      )
                    : listening
                        ? DraggableSpeechCard(
                            speechBloc: speechBloc, highlights: highlights)
                        : Container(),
              ],
            );
          },
          error: (state) => Center(child: Text("${state.message}")),
          empty: (_) => Text("Deck is empty"),
        );
      },
    );
  }
}
