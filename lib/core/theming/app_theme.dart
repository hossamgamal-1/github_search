import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_overlay_styles.dart';

class AppTheme {
  static final dark = ThemeData().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.foreground),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.foreground,
      systemOverlayStyle: AppOverlayStyles.getDarkOverlayStyle(),
    ),
  );
}
