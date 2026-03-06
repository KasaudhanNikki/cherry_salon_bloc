import 'package:flutter/material.dart';
import 'formatter.dart';
import 'validator.dart';

class Utils {
  /// Checks if the current theme is dark mode. returns true if dark mode is enabled, false otherwise.
  static bool isDark({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Returns the screen width.
  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the screen height.
  static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns the height as a percentage of the screen height.
  static double heightPercentage({
    required BuildContext context,
    required double percentage,
  }) {
    return screenHeight(context: context) * percentage / 100;
  }

  /// Returns the width as a percentage of the screen width.
  static double widthPercentage({
    required BuildContext context,
    required double percentage,
  }) {
    return screenWidth(context: context) * percentage / 100;
  }

  /// Password Validators returns null if valid, error message otherwise.
  static String? passwordValidator(String? value) {
    return Validator().password(value);
  }

  /// Email Validators returns null if valid, error message otherwise.
  static String? emailValidator(String? value) {
    return Validator().email(value);
  }

  /// Date Formatters returns formatted date strings based on the provided format defaults to 'dd/MM/yyyy'.
  static String formattedDate({DateTime? date, String format = 'dd/MM/yyyy'}) {
    return Formatter().date(date: date, format: format);
  }

  /// Time Formatters returns formatted time strings based on the provided format defaults to 'hh:mm a'.

  static String formattedTime({DateTime? date, String format = 'hh:mm a'}) {
    return Formatter().time(date: date, format: format);
  }

  /// Date with Time Formatters returns formatted date with time strings based on the provided format defaults to 'dd/MM/yyyy hh:mm a'.

  static String formattedDateWithTime({
    DateTime? date,
    String format = 'dd/MM/yyyy hh:mm a',
  }) {
    return Formatter().dateWithTime(date: date, format: format);
  }

  /// Percentage Formatter returns formatted percentage string with specified decimal places. input 12.3456 with decimalPlaces 2 returns 12.35%

  static String formattedPercentage({double? value, int decimalPlaces = 2}) {
    return Formatter().percentage(value: value, decimalPlaces: decimalPlaces);
  }

  /// Currency Formatter returns formatted currency string with specified decimal places. input 12345.678 with decimalPlaces 2 returns ₹12,345.68

  static String formattedCurrency({double? value, int decimalPlaces = 2}) {
    return Formatter().currency(value: value, decimalPlaces: decimalPlaces);
  }

  /// Integer Parser returns parsed integer from dynamic input. returns 0 if parsing fails.
  static int parseInt({dynamic value}) {
    return Formatter().parseInt(value: value);
  }

  /// Double Parser returns parsed double from dynamic input. returns 0.0 if parsing fails.

  static double parseDouble({dynamic value}) {
    return Formatter().parseDouble(value: value);
  }

  /// Time Duration Formatter returns formatted time duration string in HH:MM:SS format from total seconds.

  static String formattedTimeDurationWithSeconds({int? seconds}) {
    return Formatter().timeDurationWithSeconds(seconds: seconds);
  }
}
