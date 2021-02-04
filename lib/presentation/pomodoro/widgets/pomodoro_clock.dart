import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final isPauseProvider = StateProvider((ref) => false);

class PomodoroClock extends StatefulWidget {
  @override
  _PomodoroClockState createState() => _PomodoroClockState();
}

class _PomodoroClockState extends State<PomodoroClock>
    with AutomaticKeepAliveClientMixin {
  final CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GestureDetector(
      onLongPress: () {
        print("Long pressed");
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircularCountDownTimer(
              // Countdown duration in Seconds
              duration: 100,
              // Controller to control (i.e Pause, Resume, Restart) the Countdown
              controller: _controller,
              // Width of the Countdown Widget
              width: MediaQuery.of(context).size.width / 2,
              // Height of the Countdown Widget
              height: MediaQuery.of(context).size.height / 2,
              // Default Color for Countdown Timer
              color: Colors.white,
              // Filling Color for Countdown Timer
              fillColor: Colors.red,
              // Background Color for Countdown Widget
              backgroundColor: null,
              // Border Thickness of the Countdown Circle
              strokeWidth: 25.0,
              // Begin and end contours with a flat edge and no extension
              strokeCap: StrokeCap.butt,
              // Text Style for Countdown Text
              textStyle: TextStyle(
                  fontSize: 17.0,
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontWeight: FontWeight.bold),
              // true for reverse countdown (max to 0), false for forward countdown (0 to max)
              isReverse: true,
              // true for reverse animation, false for forward animation
              isReverseAnimation: true,
              // Optional [bool] to hide the [Text] in this widget.
              isTimerTextShown: true,
              // Function which will execute when the Countdown Ends
              onComplete: () {
                // Here, do whatever you want
                print('Countdown Ended');
              },
            ),
            Consumer(
              builder: (context, watch, child) {
                final _isPause = watch(isPauseProvider);
                return TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(_isPause.state ? "resume" : "pause",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 13.0, color: Colors.white)),
                    onPressed: () {
                      if (_isPause.state) {
                        _isPause.state = false;
                        _controller.resume();
                      } else {
                        _isPause.state = true;
                        _controller.pause();
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );

    //   floatingActionButton: FloatingActionButton.extended(
    //       onPressed: () {
    //         setState(() {
    //           if (_isPause) {
    //             _isPause = false;
    //             _controller.resume();
    //           } else {
    //             _isPause = true;
    //             _controller.pause();
    //           }
    //         });
    //       },
    //       icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
    //       label: Text(_isPause ? "Resume" : "Pause")),
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
