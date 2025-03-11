import 'package:flutter/material.dart';

class PlatformHelper {
  static bool get isDesktop => false;
  static bool get isMobile => true;
}

class AppSizer {
  // Change the default size to your design screen size
  static final Size _defaultSize =
      PlatformHelper.isDesktop ? const Size(1440, 976) : const Size(375, 812);

  final BuildContext _context;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _scaleText;

  AppSizer.initialize(this._context) {
    final size = MediaQuery.sizeOf(_context);

    _screenWidth = size.width;
    _screenHeight = size.height;

    _scaleText = _screenWidth / _defaultSize.width;
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
  double get w {
    return this / AppSizer._defaultSize.width * AppSizer._screenWidth;
  }

  double get h {
    return this / AppSizer._defaultSize.height * AppSizer._screenHeight;
  }

  double get fromWidth => this / 100 * AppSizer._screenWidth;

  double get fromHeight => this / 100 * AppSizer._screenHeight;

  double get sp => this * AppSizer._scaleText;
}
