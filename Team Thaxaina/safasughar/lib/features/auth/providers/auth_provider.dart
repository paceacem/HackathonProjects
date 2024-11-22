import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/providers/service_providers.dart';
import 'package:safasughar/features/auth/providers/states/auth_provider_state.dart';
import 'package:safasughar/features/auth/services/auth_service.dart';

final providerOfAuth =
    StateNotifierProvider.autoDispose<AuthProvider, AuthProviderState>((ref) {
  return AuthProvider(
    ref: ref,
    state: const AuthProviderState(),
  );
});

class AuthProvider extends StateNotifier<AuthProviderState> {
  AuthProvider({
    required final Ref ref,
    required final AuthProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  AuthService get _authService => _ref.read(providerOfAuthService);

  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      signInWithGoogleState: const SignInWithGoogleState.loading(),
    );

    final result = await _authService.signInWithGoogle();
    if (!mounted) return;

    result.when(
      (result) {
        state = state.copyWith(
          signInWithGoogleState: SignInWithGoogleState.success(result),
        );
      },
      (error) {
        state = state.copyWith(
          signInWithGoogleState: SignInWithGoogleState.error(error),
        );
      },
    );
  }

  Future<void> signInAnonymously() async {
    state = state.copyWith(
      signInAnonymouslyState: const SignInAnonymouslyState.loading(),
    );

    final result = await _authService.signInAnonymously();
    if (!mounted) return;

    result.when(
      (result) {
        state = state.copyWith(
          signInAnonymouslyState: SignInAnonymouslyState.success(result),
        );
      },
      (error) {
        state = state.copyWith(
          signInAnonymouslyState: SignInAnonymouslyState.error(error),
        );
      },
    );
  }

  Future<void> signOut() async {
    state = state.copyWith(
      signOutUserState: const SignOutUserState.loading(),
    );

    final result = await _authService.signOut();
    if (!mounted) return;

    result.when(
      (result) {
        state = state.copyWith(
          signOutUserState: SignOutUserState.success(result),
        );
      },
      (error) {
        state = state.copyWith(
          signOutUserState: SignOutUserState.error(error),
        );
      },
    );
  }
}
