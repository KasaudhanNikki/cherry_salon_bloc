import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onTertiary: AppColors.white,
      onError: AppColors.white,
      onSurface: AppColors.white,
    ),
  );
}
