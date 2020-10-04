import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

extension CustomDate<T> on DateTime {
  String formatDate() {
    return DateFormat.yMMMEd().format(this);
  }
}

double getRadiansFromDegree(double degree) {
  return degree * math.pi / 180;
}

extension CustomTransform<T> on Widget {
  Widget translate({@required double degree, distance, Function onPressed}) {
    return Transform.translate(
        offset:
            Offset.fromDirection(getRadiansFromDegree(degree), distance * 100),
        child: this);
  }

  Widget rotate({@required double degree, scaleValue}) {
    return Transform(
        transform: Matrix4.rotationZ(getRadiansFromDegree(degree))
          ..scale(scaleValue),
        alignment: Alignment.center,
        child: this);
  }
}
