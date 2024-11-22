import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/services/auth_service.dart';

final providerOfAuthService = Provider<AuthService>((ref) {
  return AuthService(ref: ref);
});
