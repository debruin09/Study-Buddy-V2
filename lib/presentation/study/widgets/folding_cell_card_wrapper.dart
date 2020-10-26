import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/study/deck_study_page.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:study_buddy/application/core/speech/speech_bloc.dart';
import 'dart:collection';

final queueProvider = Provider((ref) => Queue<MyCard>());

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
    final q = watch(queueProvider);
    return BlocBuilder<CardBloc, CardState>(
      cubit: cardBloc,
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => Loading(),
          success: (state) {
            state.cards.forEach((element) {
              if (!q.contains(element)) {
                q.add(element);
              }
            });
            return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Text(
                      q.first.front,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey[600],
                    ),
                    showAnswer
                        ? ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            children: [
                              Text(
                                q.first.back,
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ],
                          )
                        : Container(),
                    listening ? Divider() : Container(),
                    listening
                        ? SingleChildScrollView(
                            reverse: true,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 30.0, 30.0, 150.0),
                              child: BlocBuilder<SpeechBloc, SpeechState>(
                                  cubit: speechBloc,
                                  builder: (context, state) {
                                    return state.map(
                                      initial: (res) => Text(
                                        res.speechEntity.text,
                                        style: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      isListening: (res) => TextHighlight(
                                        text: res.speechEntity.text ??
                                            "recording...",
                                        words: HighlightMap(highlights).getMap,
                                        textStyle: const TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Container(),
                  ],
                ));
          },
          error: (state) => Center(child: Text("${state.message}")),
        );
      },
    );
  }
}
