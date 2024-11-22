import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safasughar/features/shared/models/error_model.dart';

part 'auth_provider_state.freezed.dart';

@freezed
class AuthProviderState with _$AuthProviderState {
  const factory AuthProviderState({
    /// The stae of sign in with google.
    @Default(SignInWithGoogleState.initial())
    final SignInWithGoogleState signInWithGoogleState,

    /// The state of sign in anonymously.
    @Default(SignInAnonymouslyState.initial())
    final SignInAnonymouslyState signInAnonymouslyState,

    /// The state of sign out user.
    @Default(SignOutUserState.initial())
    final SignOutUserState signOutUserState,
  }) = _AuthProviderState;
}

@freezed
class SignInWithGoogleState with _$SignInWithGoogleState {
  const factory SignInWithGoogleState.initial() = _SignInWithGoogleStateInitial;
  const factory SignInWithGoogleState.loading() = _SignInWithGoogleStateLoading;
  const factory SignInWithGoogleState.success(
    final UserCredential result,
  ) = _SignInWithGoogleStateSuccess;
  const factory SignInWithGoogleState.error(
    final AppError error,
  ) = _SignInWithGoogleStateError;
}

@freezed
class SignInAnonymouslyState with _$SignInAnonymouslyState {
  const factory SignInAnonymouslyState.initial() =
      _SignInAnonymouslyStateInitial;
  const factory SignInAnonymouslyState.loading() =
      _SignInAnonymouslyStateLoading;
  const factory SignInAnonymouslyState.success(
    final UserCredential result,
  ) = _SignInAnonymouslyStateSuccess;
  const factory SignInAnonymouslyState.error(
    final AppError error,
  ) = _SignInAnonymouslyStateError;
}

@freezed
class SignOutUserState with _$SignOutUserState {
  const factory SignOutUserState.initial() = _SignOutUserStateInitial;
  const factory SignOutUserState.loading() = _SignOutUserStateLoading;
  const factory SignOutUserState.success(
    final bool result,
  ) = _SignOutUserStateSuccess;
  const factory SignOutUserState.error(
    final AppError error,
  ) = _SignOutUserStateError;
}
