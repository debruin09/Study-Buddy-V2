import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';

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
