import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppOverlayStyles {
  const AppOverlayStyles._();

  static SystemUiOverlayStyle getDarkOverlayStyle([
    Color color = AppColors.background,
  ]) {
    return SystemUiOverlayStyle(
      statusBarColor: color,
      systemNavigationBarColor: color,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }
}
