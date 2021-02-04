import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/pomodoro/widgets/pomodoro_clock.dart';

class PomodoroClockPage extends StatefulWidget {
  @override
  _PomodoroClockPageState createState() => _PomodoroClockPageState();
}

class _PomodoroClockPageState extends State<PomodoroClockPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pomodoro Clock"),
      ),
      body: Center(child: PomodoroClock()),
    );
  }
}
