import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_overlay_styles.dart';

class AppTheme {
  static final dark = ThemeData().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.foreground,
      systemOverlayStyle: AppOverlayStyles.getDarkOverlayStyle(),
    ),
  );
}
