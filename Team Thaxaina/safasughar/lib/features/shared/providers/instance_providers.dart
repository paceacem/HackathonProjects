import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfFirebaseAuthInstance = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final providerOfFirebaseUserInstance = Provider<User?>((ref) {
  final firebaseAuth = ref.watch(providerOfFirebaseAuthInstance);
  return firebaseAuth.currentUser;
});

final providerOfGoogleSignInInstance = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn();
});

final providerOfFirebaseFirestoreInstance = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});
