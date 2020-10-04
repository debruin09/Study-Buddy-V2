import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/theme/theme_colors.dart';

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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ));
