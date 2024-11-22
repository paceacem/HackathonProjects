import 'dart:developer';

import 'package:safasughar/features/shared/models/error_model.dart';

/// Used to abstract the error handling when making API requests.
/// For a function [future], executes the [onError]
/// and catches the error. Also logs the error.
///
/// This function is based on the premise that exceptions should not
/// propagate further unhandled from the repository layer.
Future<T> runAsyncCall<T>({
  required final String name,
  required Future<T> Function() future,
  required T Function(AppError) onError,
  final bool withLog = true,
}) async {
  try {
    final response = await future();

    if (withLog && name.trim().isNotEmpty) {
      log(
        '$name executed successfully',
        name: 'runAsyncCall',
      );
    }

    return response;
  } catch (e, stkTrace) {
    final stackTrace =
        stkTrace == StackTrace.empty ? StackTrace.current : stkTrace;

    var appError = AppError(
      message: 'Something went wrong.',
      detailedMessage: e.toString(),
    );

    if (e is Exception) {
      appError = AppError(
        message: e.toString(),
      );
    } else if (e is Error) {
      if (e is ArgumentError) {
        appError = AppError(
          message: e.message,
        );
      } else if (e is AssertionError) {
        appError = AppError(
          message: e.message.toString(),
        );
      } else {
        appError = AppError(
          message: e.toString(),
        );
      }
    } else if (e is AppError) {
      appError = e;
    }

    if (withLog && name.trim().isNotEmpty) {
      log(
        '$name executed with an error',
        name: 'runAsyncCall',
        error: appError.code == null
            ? appError.message
            : '[${appError.code}]: ${appError.message}',
        stackTrace: stackTrace,
      );
    }

    return onError(appError);
  }
}
