import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void info(String message) {
    if (kDebugMode) debugPrint('[INFO] $message');
  }

  static void warning(String message) {
    if (kDebugMode) debugPrint('[WARN] $message');
  }

  static void error(String message, [Object? error]) {
    if (kDebugMode) debugPrint('[ERROR] $message${error != null ? ': $error' : ''}');
  }
}
