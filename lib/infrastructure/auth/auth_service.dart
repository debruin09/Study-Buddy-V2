import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/infrastructure/core/database_service.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';

class AuthService implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final myUid = locator.get<GlobalId>();

  AuthService({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  /// This will login the users with the email and password details
  @override
  Future<void> signInWithCredentials(String email, String password) async {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {}
  }

  /// Once the user is registered or authenticated their data will be added to the database

  /// This will log the user out
  @override
  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  /// This will check the users authentication state whether the user is signed in or not
  @override
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  /// This will get the user from firebase
  @override
  Future<User> getUser() async {
    final result = _firebaseAuth.currentUser;
    myUid.setUserId(result.uid);
    final User user =
        await FirestoreService(uid: result.uid).getUser(result.uid);
    return user;
  }

  @override
  Future<void> signUp(String username, String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirestoreService(uid: result.user.uid).updateUserData(
      email: email,
      password: password,
      uid: result.user.uid,
      username: username,
    );
  }
}
