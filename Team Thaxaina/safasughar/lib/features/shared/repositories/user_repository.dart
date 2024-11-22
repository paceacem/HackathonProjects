import 'package:safasughar/features/shared/models/app_user_model.dart';
import 'package:safasughar/features/shared/models/either.dart';
import 'package:safasughar/features/shared/models/error_model.dart';
import 'package:safasughar/features/shared/utils/async_call_helper.dart';
import 'package:safasughar/features/shared/utils/firestore_reference_helper.dart';

abstract class UserRepository {
  Future<Either<AppUser, AppError>> saveUserToFirestore({
    required final AppUser user,
  });

  Future<Either<AppUser, AppError>> getUserFromFirestore({
    required final String uid,
  });
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<AppUser, AppError>> getUserFromFirestore({
    required String uid,
  }) {
    return runAsyncCall(
      name: 'Getting user from Firestore',
      future: () async {
        final userDoc = FirestoreReferenceHelper.userDoc(uid);
        final userSnap = await userDoc.get();

        if (userSnap.exists) {
          final user = userSnap.data();
          if (user == null) throw const AppError(message: 'User not found');

          return Success(user);
        }

        throw const AppError(message: 'User not found');
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<AppUser, AppError>> saveUserToFirestore({
    required AppUser user,
  }) {
    return runAsyncCall(
      name: 'Saving user to Firestore',
      future: () async {
        final userDoc = FirestoreReferenceHelper.userDoc(user.uid);
        await userDoc.set(user);
        return Success(user);
      },
      onError: Failure.new,
    );
  }
}
