import 'package:flutter/foundation.dart';

class AuthFailure {
  String message;
  AuthFailure({@required this.message});

  @override
  String toString() => 'AuthFailure(message: $message)';
}
