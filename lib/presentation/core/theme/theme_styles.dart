import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

import 'theme_colors.dart';

final appThemeStyle = ThemeData(
  colorScheme: ColorScheme.light(
      primary: cardColor, error: Colors.red, background: bgColor),
  backgroundColor: bgColor,
  primaryColor: cardColor,
  textTheme: Typography.englishLike2018,
  iconTheme: IconThemeData(),
  buttonTheme: ButtonThemeData(),
  accentColor: titleColor,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: primaryColor,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
);

final inputStyle = InputDecoration(
    focusColor: Colors.white,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: primaryColor,
        width: 5.0,
        style: BorderStyle.solid,
      ),
    ));
