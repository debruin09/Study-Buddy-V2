// import 'package:study_buddy/models/user.dart';
// import 'package:study_buddy/repositories/auth_repository.dart';
// import 'package:study_buddy/services/database_service.dart';

// class FakeAuthClient {
//   String uid = "dsfdsfsd";
//   bool signOut = false;
//   Future<bool> isAuthenticated() async {
//     if (signOut == true) {
//       return false;a
//     }
//     return currentUser() != null ? true : false;
//   }

//   Future<User> currentUser() async {
//     final currentUser = await signInWithEmailAndPassword();
//     return currentUser;
//   }

//   Future<void> signedOut() async {
//     signOut = true;
//   }

//   Future<User> signInWithEmailAndPassword(
//       {String email, String password}) async {
//     return User(uid: uid);
//   }

//   Future<User> createUserWithEmailAndPassword(
//       {String email, password, username}) async {
//     signInWithEmailAndPassword(email: email, password: password);
//     return User(uid: uid, username: username, email: email);
//   }
// }

// class FakeAuthService implements AuthRepository {
//   FakeAuthClient fakeAuthClient;
//   FakeAuthService(this.fakeAuthClient);

//   @override
//   Future<User> getUser() async {
//     final result = await fakeAuthClient.currentUser();
//     final User user =
//         await FirestoreService(uid: result.uid).getUser(result.uid);
//     return user;
//   }

//   @override
//   Future<bool> isSignedIn() async {
//     final currentUser = await fakeAuthClient.currentUser();
//     return currentUser != null;
//   }

//   @override
//   Future<void> signInWithCredentials(String email, String password) async {
//     return;
//   }

//   @override
//   Future<void> signOut() async {
//     print("Signed Out");
//     return Future.wait([fakeAuthClient.signedOut()]);
//   }

//   @override
//   Future<void> signUp(String username, String email, String password) async {
//     final result = await fakeAuthClient.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     await FirestoreService(uid: result.uid).updateUserData(
//       email: email,
//       password: password,
//       uid: result.uid,
//       username: username,
//     );
//   }
// }
