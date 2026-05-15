import 'dart:developer' as dev;

class AppLogger {
  static void d(String message) {
    dev.log('DEBUG: $message', name: 'APP');
  }

  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    dev.log('ERROR: $message', name: 'APP', error: error, stackTrace: stackTrace);
  }

  static void i(String message) {
    dev.log('INFO: $message', name: 'APP');
  }
}
