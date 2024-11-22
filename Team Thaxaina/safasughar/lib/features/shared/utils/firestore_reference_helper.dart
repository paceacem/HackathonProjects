import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safasughar/features/shared/models/app_user_model.dart';

class FirestoreReferenceHelper {
  static final _ref = FirebaseFirestore.instance;

  static FirebaseFirestore get ref => _ref;

  static String get randomId => _ref.collection('rand').doc().id;

  static CollectionReference get usersCol => _ref.collection('users');

  static DocumentReference<AppUser> userDoc(final String uid) =>
      usersCol.doc(uid).withConverter(
            fromFirestore: (snap, _) => AppUser.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson(),
          );
}
