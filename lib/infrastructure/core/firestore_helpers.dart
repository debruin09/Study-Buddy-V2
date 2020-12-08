import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_buddy/domain/auth/i_auth_facade.dart';
import 'package:study_buddy/domain/core/errors.dart';
import 'package:study_buddy/injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await locator.get<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get deckCollection => collection('decks');
}
