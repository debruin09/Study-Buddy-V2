import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/study/deck_study_page.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:study_buddy/application/core/speech/speech_bloc.dart';
import 'dart:collection';

final queueProvider = Provider.autoDispose((ref) => Queue<MyCard>());
final queueReader =
    Provider.autoDispose<Queue<MyCard>>((ref) => ref.watch(queueProvider));

class BodyWrapper extends ConsumerWidget {
  final CardBloc cardBloc;
  final SpeechBloc speechBloc;
  final Map<String, HighlightedWord> highlights;

  BodyWrapper(
      {Key key, @required this.cardBloc, this.speechBloc, this.highlights})
      : super(key: key);
  @override
  Widget build(BuildContext contexth, ScopedReader watch) {
    final showAnswer = watch(showAnswerProvider).state;
    final listening = watch(isListeningProvider).state;
    final queue = watch(queueReader);
    return BlocBuilder<CardBloc, CardState>(
      cubit: cardBloc,
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => Loader(
            color: primaryColor,
          ),
          success: (state) {
            queue.addAll(state.cards);
            if (queue.first.me != state.cards.first.me) {
              queue.clear();
              queue.addAll(state.cards);
            }
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    queue.first.front,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
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
                                    controller: scrollController,
                                    child: BlocBuilder<SpeechBloc, SpeechState>(
                                        cubit: speechBloc,
                                        builder: (context, state) {
                                          return state.map(
                                            initial: (res) => TextHighlight(
                                              text: res.speechEntity.text,
                                              words: HighlightMap(highlights)
                                                  .getMap,
                                              textStyle: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            isListening: (res) {
                                              return TextHighlight(
                                                text:
                                                    "${res.speechEntity.text}",
                                                words: HighlightMap(highlights)
                                                    .getMap,
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
