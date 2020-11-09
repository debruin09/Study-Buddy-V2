import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:study_buddy/application/core/speech/speech_bloc.dart';

class DraggableSpeechCard extends StatelessWidget {
  final SpeechBloc speechBloc;
  final Map<String, HighlightedWord> highlights;

  const DraggableSpeechCard(
      {Key key, @required this.speechBloc, @required this.highlights})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
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
              padding:
                  const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
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
                            text: "${res.speechEntity.text}",
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
        });
  }
}
