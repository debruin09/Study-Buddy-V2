import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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

  bool _isListening = false;

  String _text = 'Press the button to record';
  double _confidence = 1.0;

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
            child: TextHighlight(
              text: _text,
              words: _highlights,
              textStyle: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: Colors.blueAccent,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: _listen,
            child: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
          endRadius: 75.0),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        debugLogging: true,
        onStatus: (val) => print("OnStatus: $val"),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (res) => setState(() {
            _text = res.recognizedWords;
            if (res.hasConfidenceRating && res.confidence > 0) {
              _confidence = res.confidence;
            }
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }
}
