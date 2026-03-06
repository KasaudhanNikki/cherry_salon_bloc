import 'package:intl/intl.dart';

class Formatter {
  final DateTime _today = DateTime.now();
  //date
  String date({DateTime? date, String format = 'dd/MM/yyyy'}) {
    DateFormat formatter = DateFormat(format);
    if (date == null) return formatter.format(_today);
    return formatter.format(date);
  }

  String time({DateTime? date, String format = 'hh:mm a'}) {
    DateFormat formatter = DateFormat(format);
    if (date == null) return formatter.format(_today);
    return formatter.format(date);
  }

  String dateWithTime({DateTime? date, String format = 'dd/MM/yyyy hh:mm a'}) {
    DateFormat formatter = DateFormat(format);
    if (date == null) return formatter.format(_today);
    return formatter.format(date);
  }

  double parseDouble({dynamic value}) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }

  int parseInt({dynamic value}) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  String currency({
    double? value,
    int decimalPlaces = 2,
    String currency = 'INR',
  }) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: currency,
      decimalDigits: decimalPlaces,
    );
    if (value == null) return currencyFormatter.format(0);
    return currencyFormatter.format(value);
  }

  String percentage({double? value, int decimalPlaces = 2}) {
    if (value == null) return '0.00%';
    return '${value.toStringAsFixed(decimalPlaces)}%';
  }

  String timeDurationWithSeconds({int? seconds}) {
    if (seconds == null) return '00:00:00';
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
