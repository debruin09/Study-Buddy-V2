// TimeIntervalWidget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';

final showAnswerProvider = StateProvider((ref) => false);

class TimeIntervalWidget extends ConsumerWidget {
  const TimeIntervalWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isShowAnswer = watch(showAnswerProvider).state;

    return !isShowAnswer
        ? Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: MaterialButton(
              color: Colors.white,
              onPressed: () =>
                  BuildContextX(context).read(showAnswerProvider).state = true,
              child: Text(
                "SHOW ANSWER(S)",
                style: TextStyle(fontSize: 16.0, color: primaryColor),
              ),
              minWidth: double.infinity,
            ),
          )
        : Card(
            elevation: 2.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Difficulty(
                    icon: Icons.thumb_down,
                    label: "bad",
                    pressed: () {
                      ReadContext(context)
                          .read<DeckFormBloc>()
                          .add(const DeckFormEvent.hardIncrement());

                      BuildContextX(context).read(showAnswerProvider).state =
                          false;
                    },
                  ),
                ),
                Expanded(
                  child: Difficulty(
                    label: "moderate",
                    icon: Icons.star_half,
                    pressed: () {
                      ReadContext(context)
                          .read<DeckFormBloc>()
                          .add(const DeckFormEvent.moderateIncrement());

                      BuildContextX(context).read(showAnswerProvider).state =
                          false;
                    },
                  ),
                ),
                Expanded(
                  child: Difficulty(
                    icon: Icons.thumb_up,
                    label: "good",
                    pressed: () {
                      ReadContext(context)
                          .read<DeckFormBloc>()
                          .add(const DeckFormEvent.easyIncrement());

                      BuildContextX(context).read(showAnswerProvider).state =
                          false;
                    },
                  ),
                ),
              ],
            ));
  }
}

class Difficulty extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function pressed;

  const Difficulty({
    Key key,
    this.icon,
    this.label,
    this.pressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: pressed,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            "$label",
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
          Icon(
            icon,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

extension DeckFormBlocX on BuildContext {
  DeckFormBloc get form => ReadContext(this).read<DeckFormBloc>();
}
