import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark, // ✅ important
    scaffoldBackgroundColor: Colors.black, // ✅ direct color

    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      error: AppColors.error,

      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.white,
      onError: Colors.white,
      onSurface: Colors.white,
    ),
  );
}
