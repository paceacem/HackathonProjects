import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safasughar/features/shared/extensions/string_extension.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    /// The unique identifier of the user.
    required final String uid,

    /// The full name of the user.
    final String? fullName,

    /// The email address of the user.
    final String? email,

    /// The photo URL of the user.
    final String? photoUrl,

    /// The short introduction of the user.
    final String? bio,

    /// Whether the user is anonymous.
    @Default(false) final bool isAnonymous,
  }) = _AppUser;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get firstName => (fullName?.isEmpty ?? true)
      ? ''
      : fullName?.split(' ').first.capitalizeFirstLetter ?? '';

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get lastName => (fullName?.isEmpty ?? true)
      ? ''
      : fullName?.split(' ').last.capitalizeFirstLetter ?? '';

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
