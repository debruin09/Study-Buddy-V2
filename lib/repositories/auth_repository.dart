import 'package:study_buddy/models/models.dart';

abstract class AuthRepository {
  Future<User> getUser();
  Future<void> signInWithCredentials(String email, String password);
  Future<void> signUp(
    String username,
    String email,
    String password,
  );
  Future<void> signOut();
  Future<bool> isSignedIn();
}
