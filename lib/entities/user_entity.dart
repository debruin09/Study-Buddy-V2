import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  String uid;
  String email;
  String username;
  UserEntity({
    this.uid,
    this.email,
    this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserEntity(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }

  static UserEntity fromFirebase(User firebaseUser) {
    return firebaseUser != null
        ? UserEntity(
            uid: firebaseUser.uid,
          )
        : null;
  }
}
