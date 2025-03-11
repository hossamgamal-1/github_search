import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_sizer.dart';

TextStyle appTextStyle({
  Color? color = AppColors.foreground,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontStyle: fontStyle,
    decoration: decoration,
    fontWeight: fontWeight,
    // TODO: Add Custom Font Family
    // fontFamily: FontConstants.fontFamily,
    wordSpacing: wordSpacing,
    fontSize: fontSize != null ? fontSize.sp : 24.sp,
    letterSpacing: letterSpacing,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    color: color,
  );
}
