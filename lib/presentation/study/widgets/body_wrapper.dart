import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/domain/core/scheduler/queue_scheduler.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
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
            if (queue.isEmpty) {
              return Center(child: Text("Study complete"));
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
                            queue.first.front,
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
                        initialSize: 0.9,
                        minSize: 0.9,
                        text: queue.first.back,
                      )
                    : Container(),
                listening ? Divider() : Container(),
                queue.first.me != null && !listening
                    ? DraggableCard(
                        initialSize: 0.7,
                        text: queue.first.me,
                      )
                    : listening
                        ? DraggableScrollableSheet(
                            expand: true,
                            initialChildSize: 0.9,
                            maxChildSize: 0.9,
                            minChildSize: 0.1,
                            builder: (context, scrollController) {
                              return Card(
                                color: Colors.white.withOpacity(0.6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0)),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 15.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0)),
                                  ),
                                  child: SingleChildScrollView(
                                    reverse: true,
                                    controller: scrollController,
                                    child: BlocBuilder<SpeechBloc, SpeechState>(
                                        cubit: speechBloc,
                                        builder: (context, state) {
                                          return state.map(
                                            initial: (res) => TextHighlight(
                                              text: res.speechEntity.text,
                                              words: highlights,
                                              textStyle: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            isListening: (res) {
                                              return TextHighlight(
                                                text:
                                                    "${res.speechEntity.text}",
                                                words: highlights,
                                                textStyle: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                  ),
                                ),
                              );
                            })
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

class DraggableCard extends StatelessWidget {
  final String text;
  final double initialSize, minSize;

  const DraggableCard({
    Key key,
    @required this.text,
    @required this.initialSize,
    this.minSize = 0.1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: initialSize,
        maxChildSize: 0.9,
        minChildSize: minSize,
        builder: (context, scrollController) {
          return Card(
            color: primaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding:
                  const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
