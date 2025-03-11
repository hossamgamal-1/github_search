import 'dart:developer';

import 'package:flutter/foundation.dart';

class LogHelper {
  static void logSuccess(Object? text) {
    _logWithColor(text, 32);
  }

  static void logError(Object? text) {
    _logWithColor(text, 31);
  }

  static void logWarning(Object? text) {
    _logWithColor(text, 35);
  }

  static void _logWithColor(Object? text, int colorNum) {
    if (kReleaseMode || text == null) return;

    log('\x1B[$colorNum m$text\x1B[0m');
  }
}
