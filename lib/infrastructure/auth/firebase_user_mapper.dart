import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:study_buddy/domain/auth/user.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User();
  }
}
