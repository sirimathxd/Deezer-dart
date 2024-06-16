import 'package:dio/dio.dart';

enum DeezerExceptionType {
  initFailed,
  network,
  invalidResponse,
  invalidToken,
  invalidARL,
  failedRequest,
  loginExpired,
  decryptionFailed,
  unknown,
}

extension _DeezerExceptionTypeExtension on DeezerExceptionType {
  String toPrettyDescription() {
    switch (this) {
      case DeezerExceptionType.initFailed:
        return 'initilization failed';
      case DeezerExceptionType.network:
        return 'network error';
      case DeezerExceptionType.invalidResponse:
        return 'invalid response';
      case DeezerExceptionType.invalidToken:
        return 'invalid token';
      case DeezerExceptionType.invalidARL:
        return 'invalid ARL';
      case DeezerExceptionType.failedRequest:
        return 'failed request';
      case DeezerExceptionType.loginExpired:
        return 'login expired';
      case DeezerExceptionType.decryptionFailed:
        return 'decryption failed';
      case DeezerExceptionType.unknown:
        return 'unknown';
    }
  }
}

/// [DeezerException] describes the exception info.
class DeezerException implements Exception {
  /// Prefer using one of the other constructors.
  /// They're most likely better fitting.
  DeezerException({
    required this.type,
    required this.message,
    this.error,
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.current;

  factory DeezerException.initFailed({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      DeezerException(
        type: DeezerExceptionType.initFailed,
        message: message,
        error: error,
        stackTrace: stackTrace,
      );

  factory DeezerException.invalidResponse({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      DeezerException(
        type: DeezerExceptionType.invalidResponse,
        message: message,
        error: error,
        stackTrace: stackTrace,
      );

  factory DeezerException.invalidToken({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      DeezerException(
        type: DeezerExceptionType.invalidToken,
        message: message,
        error: error,
        stackTrace: stackTrace,
      );

  factory DeezerException.invalidARL({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      DeezerException(
        type: DeezerExceptionType.invalidARL,
        message: message,
        error: error,
        stackTrace: stackTrace,
      );

  factory DeezerException.failedRequest({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      DeezerException(
        type: DeezerExceptionType.failedRequest,
        message: message,
        error: error,
        stackTrace: stackTrace,
      );

  final DeezerExceptionType type;
  final String? message;
  final Object? error;
  final StackTrace stackTrace;

  DeezerException copyWith({
    DeezerExceptionType? type,
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    return DeezerException(
      type: type ?? this.type,
      message: message ?? this.message,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }

  factory DeezerException.dioException(DioException e) {
    return DeezerException(
      type: DeezerExceptionType.network,
      message: e.message,
      error: e,
      stackTrace: e.stackTrace,
    );
  }

  factory DeezerException.unknownException(
    String message,
    Object e, StackTrace s,
    ) {
    return DeezerException(
      type: DeezerExceptionType.unknown,
      message: message,
      error: e,
      stackTrace: s,
    );
  }

  factory DeezerException.decryptionFailed(
    String message,
    Object e,
    StackTrace s,
    ) {
    return DeezerException(
      type: DeezerExceptionType.decryptionFailed,
      message: message,
      error: e,
      stackTrace: s,
    );
  }

  @override
  String toString() {
    String msg = 'DeezerException [${type.toPrettyDescription()}]: $message';
    if (error != null) {
      msg += '\n$error';
    }
    return msg;
  }
}