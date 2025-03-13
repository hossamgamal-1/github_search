import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  const SearchTextField({super.key, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: min(100.fromWidth, 500),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
      child: TextField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          focusedBorder: _getOutlinedBorder(AppColors.blue),
          enabledBorder: _getOutlinedBorder(AppColors.grey),
          hintText: hintText,
          isCollapsed: true,
          fillColor: AppColors.background,
          filled: true,
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
      ),
    );
  }

  InputBorder _getOutlinedBorder(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1.3),
    borderRadius: BorderRadius.circular(16),
  );
}
