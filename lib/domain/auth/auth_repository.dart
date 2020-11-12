import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Option<User>> getSignedInUser();
  Future<void> signInWithCredentials({
    @required String emailAddress,
    @required String password,
  });
  Future<void> signUp({
    @required String emailAddress,
    @required String password,
  });
  Future<void> signOut();
  Future<void> signInWithGoogle();
}
