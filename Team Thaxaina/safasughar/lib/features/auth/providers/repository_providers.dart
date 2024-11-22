import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/repositories/auth_repository.dart';
import 'package:safasughar/features/shared/providers/instance_providers.dart';

final providerOfAuthRepository = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    googleSignIn: ref.watch(providerOfGoogleSignInInstance),
    firebaseAuth: ref.watch(providerOfFirebaseAuthInstance),
  );
});
