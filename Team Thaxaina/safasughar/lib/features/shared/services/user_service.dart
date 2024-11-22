import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/shared/models/app_user_model.dart';
import 'package:safasughar/features/shared/models/either.dart';
import 'package:safasughar/features/shared/models/error_model.dart';
import 'package:safasughar/features/shared/providers/repository_providers.dart';
import 'package:safasughar/features/shared/repositories/user_repository.dart';

class UserService {
  const UserService({
    required final Ref ref,
  }) : _ref = ref;

  final Ref _ref;
  UserRepository get _userRepository => _ref.read(providerOfUserRepository);

  /// Save user to Firestore.
  ///
  /// The [user] parameter is the user model to save.
  Future<Either<AppUser, AppError>> saveUserToFirestore({
    required final AppUser user,
  }) {
    return _userRepository.saveUserToFirestore(user: user);
  }

  /// Get user from Firestore.
  ///
  /// The [uid] parameter is the firebase auth userId.
  Future<Either<AppUser, AppError>> getUserFromFirestore({
    required final String uid,
  }) {
    return _userRepository.getUserFromFirestore(uid: uid);
  }
}
