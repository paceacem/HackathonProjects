import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safasughar/features/shared/models/either.dart';
import 'package:safasughar/features/shared/models/error_model.dart';
import 'package:safasughar/features/shared/utils/async_call_helper.dart';

abstract class AuthRepository {
  Future<Either<UserCredential, AppError>> signInWithGoogle();

  Future<Either<UserCredential, AppError>> signInAnonymously();

  Future<Either<bool, AppError>> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required final GoogleSignIn googleSignIn,
    required final FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<Either<UserCredential, AppError>> signInWithGoogle() async {
    return runAsyncCall(
      name: 'Sign in with google',
      future: () async {
        final account = await _googleSignIn.signIn();
        if (account == null) {
          throw const AppError(
            message: 'Google sign in failed',
          );
        }

        final googleAuth = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await _firebaseAuth.signInWithCredential(
          credential,
        );
        return Success(userCredential);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<UserCredential, AppError>> signInAnonymously() {
    return runAsyncCall(
      name: 'Sign in anonymously',
      future: () async {
        final userCredential = await _firebaseAuth.signInAnonymously();
        return Success(userCredential);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, AppError>> signOut() {
    return runAsyncCall(
      name: 'Sign out the user from the app',
      future: () async {
        await Future.wait([
          _firebaseAuth.signOut(),
          if (_googleSignIn.currentUser != null) _googleSignIn.signOut(),
        ]);

        return const Success(true);
      },
      onError: Failure.new,
    );
  }
}
