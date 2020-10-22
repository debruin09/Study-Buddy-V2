import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:study_buddy/application/core/speech/speech_bloc.dart';
import 'package:study_buddy/injection.dart';

final isListeningProvider = StateProvider((ref) => false);

class SpeechPage extends StatefulWidget {
  @override
  _SpeechPageState createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> {
  final Map<String, HighlightedWord> _highlights = {
    'database': HighlightedWord(
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

  stt.SpeechToText _speech;

  // bool _isListening = false;

  // String _text = 'Press the button to record';
  double _confidence = 1.0;

  final _speechBloc = locator.get<SpeechBloc>();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: BlocBuilder<SpeechBloc, SpeechState>(
              cubit: _speechBloc,
              builder: (context, state) {
                return state.map(
                  initial: (res) => Text(
                    res.speechEntity.text,
                    style: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  isListening: (res) => TextHighlight(
                    text: res.speechEntity.text ?? "record",
                    words: HighlightMap(_highlights).getMap,
                    textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                );
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer(
        builder: (context, watch, child) {
          final listening = watch(isListeningProvider).state;
          return AvatarGlow(
              animate: listening,
              glowColor: Colors.greenAccent,
              duration: const Duration(milliseconds: 2000),
              repeatPauseDuration: const Duration(milliseconds: 100),
              repeat: true,
              child: FloatingActionButton(
                onPressed: _listen,
                child: listening
                    ? Icon(
                        Icons.mic,
                        color: Colors.greenAccent,
                      )
                    : Icon(
                        Icons.mic_none,
                        color: Colors.white,
                      ),
              ),
              endRadius: 75.0);
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

        _speech.listen(onResult: (res) {
          _speechBloc.add(SpeechEvent.onChange(text: res.recognizedWords));
          if (res.hasConfidenceRating && res.confidence > 0) {
            _confidence = res.confidence;
          }
        });
      }
    } else {
      context.read(isListeningProvider).state = false;
      _speech.stop();
    }
  }
}

class RecordButton extends StatelessWidget {
  final Function listen;

  const RecordButton({Key key, this.listen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final listening = watch(isListeningProvider).state;
        return AvatarGlow(
            animate: listening,
            glowColor: Colors.greenAccent,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: FloatingActionButton(
              onPressed: listen,
              child: listening
                  ? Icon(
                      Icons.mic,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.mic_none,
                      color: Colors.white,
                    ),
            ),
            endRadius: 75.0);
      },
    );
  }
}
