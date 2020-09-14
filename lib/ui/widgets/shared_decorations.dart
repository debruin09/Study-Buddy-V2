import 'package:flutter/material.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';

const cardInputDecoration = InputDecoration();
const BoxDecoration deckDecoration = BoxDecoration(
  color: cardColor,
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0.0, 6.0),
      blurRadius: 0.7,
    )
  ],
);
