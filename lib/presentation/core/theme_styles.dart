import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';

import './theme_colors.dart';

final appThemeStyle = ThemeData(
  colorScheme: ColorScheme.light(
      primary: cardColor, error: Colors.red, background: bgColor),
  backgroundColor: bgColor,
  primaryColor: cardColor,
  textTheme: Typography.englishLike2018,
  iconTheme: IconThemeData(color: Colors.white),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: Colors.white),
    color: primaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      bodyText1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(),
  accentColor: titleColor,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: primaryColor,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
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

const studyTextTheme = TextStyle(
  fontSize: 20.0,
);
