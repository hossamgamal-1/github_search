import 'package:flutter/material.dart';

class AppSizer {
  static late double _screenWidth;
  static late double _screenHeight;

  AppSizer.initialize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    _screenWidth = size.width;
    _screenHeight = size.height;
  }

  static Future<void> ensureScreenSize() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();

    await Future.doWhile(() {
      final window = binding.platformDispatcher.implicitView;

      if (window == null || window.physicalSize.isEmpty) {
        return Future.delayed(const Duration(milliseconds: 10), () => true);
      }

      return false;
    });

    binding.allowFirstFrame();
  }
}

extension Responsive on num {
  double get fromWidth => this / 100 * AppSizer._screenWidth;

  double get fromHeight => this / 100 * AppSizer._screenHeight;
}
