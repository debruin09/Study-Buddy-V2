import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/core/theme/theme_styles.dart';

Widget cardTextField(
    TextEditingController controller, String labelText, int maxLines) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: inputStyle.copyWith(
        labelText: labelText,
      ),
      keyboardType: TextInputType.multiline,
      autocorrect: false,
    ),
  );
}
