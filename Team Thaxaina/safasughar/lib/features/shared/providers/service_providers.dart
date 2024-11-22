import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/shared/services/user_service.dart';

/// Provider of [UserService].
final providerOfUserService = Provider<UserService>((ref) {
  return UserService(ref: ref);
});
