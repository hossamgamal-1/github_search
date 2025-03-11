import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppOverlayStyles {
  const AppOverlayStyles._();

  static SystemUiOverlayStyle getBrightOverlayStyle({
    Color statusBarColor = AppColors.foreground,
    Color navigationBarColor = AppColors.foreground,
  }) {
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: navigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  static SystemUiOverlayStyle getDarkOverlayStyle([
    Color color = AppColors.background,
  ]) {
    return SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: color,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }

  static const transperantOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
