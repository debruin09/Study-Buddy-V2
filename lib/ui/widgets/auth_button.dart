import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Function onPressed;
  final Text text;
  final Color color;

  const AuthButton({Key key, this.onPressed, this.text, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      minWidth: double.infinity,
      height: 50.0,
      child: text,
    );
  }
}
