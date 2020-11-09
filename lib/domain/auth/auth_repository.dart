import 'package:study_buddy/domain/auth/user.dart';
import 'package:dartz/dartz.dart';
import 'package:study_buddy/domain/auth/auth_failure.dart';

abstract class AuthRepository {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithCredentials(
      String email, String password);
  Future<Either<AuthFailure, Unit>> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
