import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError({
    required final String message,
    final String? code,
    final String? detailedMessage,
  }) = _AppError;
}
