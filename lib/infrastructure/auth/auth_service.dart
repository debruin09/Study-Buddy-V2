import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_buddy/domain/auth/auth_failure.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/infrastructure/core/database_service.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:study_buddy/infrastructure/auth/firebase_user_mapper.dart';

class AuthService implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final myUid = locator.get<GlobalId>();

  AuthService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  /// This will login the users with the email and password details
  @override
  Future<void> signInWithCredentials({
    @required String emailAddress,
    @required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);

      myUid.setUser(
          User(uid: result.user.uid, username: result.user.displayName));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return AuthFailure.invalidEmailAndPasswordCombination();
      } else {
        return AuthFailure.serverError();
      }
    }
  }

  /// This will log the user out
  @override
  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<void> signUp({
    @required String emailAddress,
    @required String password,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      myUid.setUser(
          User(uid: result.user.uid, username: result.user.displayName));

      return await FirestoreService(uid: result.user.uid).updateUserData(
        uid: result.user.uid,
        username: result.user.displayName ?? "Test user",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return AuthFailure.emailAlreadyInUse();
      } else {
        return AuthFailure.serverError();
      }
    }
  }

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return AuthFailure.cancelledByUser();
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      final result = await _firebaseAuth.signInWithCredential(authCredential);

      myUid.setUser(
          User(uid: result.user.uid, username: result.user.displayName));
    } on FirebaseAuthException catch (_) {
      return AuthFailure.serverError();
    }
  }
}
