import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/presentation/study/misc/providers.dart';

class RecordButton extends HookWidget {
  final VoidCallback listen;

  const RecordButton({Key key, @required this.listen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final listening = useProvider(isListeningProvider).state;

    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Consumer(
          builder: (context, watch, child) {
            return Row(
              children: [
                AvatarGlow(
                  animate: listening,
                  glowColor: Colors.yellow,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: FloatingActionButton(
                    onPressed: listen,
                    child: !listening
                        ? Icon(
                            Icons.mic_none,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.mic,
                            color: Colors.yellow,
                          ),
                  ),
                  endRadius: 75.0,
                ),
                const SizedBox(width: 5.0),
                !listening
                    ? TextButton(
                        onPressed: () =>
                            context.read(showRecordProvider).state = false,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text(
                          "back to studying!",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Text(
                        "recording...",
                        style: TextStyle(fontSize: 12.0),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
