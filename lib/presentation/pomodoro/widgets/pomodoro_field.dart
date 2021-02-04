import 'package:flutter/material.dart';

class PomodoroField extends StatelessWidget {
  final TextEditingController controller;
  final String text, subtext;
  const PomodoroField({
    Key key,
    @required this.controller,
    @required this.subtext,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                subtext,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 12.0),
              ),
            ],
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    style: BorderStyle.solid,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    style: BorderStyle.solid,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
