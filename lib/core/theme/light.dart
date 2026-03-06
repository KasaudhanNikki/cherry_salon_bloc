import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onTertiary: AppColors.white,
      onError: AppColors.white,
      onSurface: AppColors.black,
    ),
  );
}
