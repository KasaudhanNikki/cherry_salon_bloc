import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFee2b4b);
  static const Color secondary = Color(0xFFffd1d8);
  static const Color accent = Color(0xFF3333FF);

  static const Color error = Color(0xFFFF0000);
  static const Color gray = Color(0xFF808080);

  static Color background(BuildContext context) =>
      Theme.of(context).colorScheme.background;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).colorScheme.onBackground;

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withOpacity(0.6);

  static Color card(BuildContext context) => Theme.of(context).cardColor;

  static Color border(BuildContext context) => Theme.of(context).dividerColor;

  static Color errorColor(BuildContext context) =>
      Theme.of(context).colorScheme.error;
}
