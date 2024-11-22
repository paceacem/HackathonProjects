import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/providers/repository_providers.dart';
import 'package:safasughar/features/auth/repositories/auth_repository.dart';
import 'package:safasughar/features/shared/models/app_user_model.dart';
import 'package:safasughar/features/shared/models/either.dart';
import 'package:safasughar/features/shared/models/error_model.dart';
import 'package:safasughar/features/shared/providers/instance_providers.dart';
import 'package:safasughar/features/shared/providers/service_providers.dart';
import 'package:safasughar/features/shared/services/user_service.dart';

class AuthService {
  const AuthService({
    required final Ref ref,
  }) : _ref = ref;

  final Ref _ref;

  AuthRepository get _authRepository => _ref.read(providerOfAuthRepository);
  UserService get _userService => _ref.read(providerOfUserService);

  /// Signs in the user with their Google account.
  Future<Either<UserCredential, AppError>> signInWithGoogle() async {
    final result = await _authRepository.signInWithGoogle();

    // when sign in is successful, save the user to firestore if it's a new user
    final newResult = await _saveUserToFirestore(result);

    newResult.whenSuccess(
      (success) {
        // refresh the firebase auth and user state
        _ref
          ..invalidate(providerOfFirebaseAuthInstance)
          ..invalidate(providerOfFirebaseUserInstance);
      },
    );

    return newResult;
  }

  /// Signs in the user anonymously.
  ///
  /// This is useful when the user doesn't want to sign in with their Google account.
  Future<Either<UserCredential, AppError>> signInAnonymously() async {
    final result = await _authRepository.signInAnonymously();

    // when sign in is successful, save the user to firestore if it's a new user
    final newResult = await _saveUserToFirestore(result);

    newResult.whenSuccess(
      (success) {
        // refresh the firebase auth and user state
        _ref
          ..invalidate(providerOfFirebaseAuthInstance)
          ..invalidate(providerOfFirebaseUserInstance);
      },
    );

    return newResult;
  }

  /// Signs out the user.
  Future<Either<bool, AppError>> signOut() async {
    final result = await _authRepository.signOut();

    result.whenSuccess(
      (success) {
        // refresh the firebase auth and user state
        _ref
          ..invalidate(providerOfFirebaseAuthInstance)
          ..invalidate(providerOfFirebaseUserInstance);
      },
    );

    return result;
  }

  /// Saves the user to firestore if it's a new user.
  ///
  /// The [result] parameter is the result of the sign in operation that contains the user credential.
  Future<Either<UserCredential, AppError>> _saveUserToFirestore(
    final Either<UserCredential, AppError> result,
  ) {
    final faker = Faker();

    return result.when<Future<Either<UserCredential, AppError>>>(
      (userCred) async {
        final isNewUser = userCred.additionalUserInfo?.isNewUser ?? false;

        if (isNewUser && userCred.user?.uid != null) {
          // save the user to firestore
          final result = await _userService.saveUserToFirestore(
            user: AppUser(
              uid: userCred.user!.uid,
              email: userCred.user?.email,
              fullName: userCred.user?.displayName ??
                  '${faker.person.firstName()} ${faker.person.lastName()}',
              bio: faker.lorem.sentence(),
              photoUrl: userCred.user?.photoURL,
              isAnonymous: userCred.user?.isAnonymous ?? false,
            ),
          );

          return result.when(
            (success) => Success(userCred),
            (error) => Failure(error),
          );
        }

        return Success(userCred);
      },
      (error) async => Failure(error),
    );
  }
}
