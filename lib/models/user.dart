import 'package:study_buddy/entities/entities.dart';

class User {
  String uid;
  String email;
  String username;
  User({
    this.uid,
    this.email,
    this.username,
  });

  User copyWith({
    String uid,
    String email,
    String username,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }

  static User fromEntity(UserEntity userEntity) {
    return userEntity != null
        ? User(
            uid: userEntity.uid,
          )
        : null;
  }

  @override
  String toString() {
    return 'User(uid: $uid, email: $email, username: $username)';
  }
}
