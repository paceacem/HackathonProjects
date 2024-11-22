import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/shared/repositories/user_repository.dart';

final providerOfUserRepository = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});
