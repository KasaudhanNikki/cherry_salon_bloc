import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light, // ✅ important
    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      error: AppColors.error,

      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.white,
      onError: Colors.white,
      onSurface: Colors.black,
    ),
  );
}