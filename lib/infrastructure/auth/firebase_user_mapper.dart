import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
      // username: displayName == "" ? "Test Account" : displayName,
      // email: email,
    );
  }
}
