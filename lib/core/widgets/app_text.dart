import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextStyle? style;
  final Gradient? gradient;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    if (gradient == null) return child;

    return ShaderMask(
      shaderCallback: (bounds) => gradient!.createShader(bounds),
      child: child,
    );
  }

  Widget get child {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      style: (style ?? appTextStyle()).copyWith(
        // Make sure the text color is white in case of gradient so that it gets applied properly
        color: gradient == null ? null : Colors.white,
      ),
      textAlign: textAlign ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
