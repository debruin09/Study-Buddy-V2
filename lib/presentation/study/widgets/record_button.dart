import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:study_buddy/presentation/study/study_page.dart';

class RecordButton extends StatelessWidget {
  final Function listen;

  const RecordButton({Key key, this.listen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final listening = true;
        // watch(isListeningProvider).state;
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
