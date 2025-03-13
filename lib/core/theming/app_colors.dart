import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const background = Color(0xFF0D1117);
  static const foreground = Color(0xFFFFFFFF);
  static const grey = Color(0xFF3D444D);
  static const blue = Color(0xFF1B62CF);
  static const red = Color(0xFFFF0000);
  static const green = Color(0xFF4CAF50);
  static const transparent = Colors.transparent;

  static final backgroundWithOpacity = background.withValues(alpha: .5);
  static const shimmerHighlight = Color(0xFF272727);
}
