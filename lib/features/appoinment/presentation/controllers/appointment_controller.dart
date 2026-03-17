import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/appointment_helper.dart';
import '../../data/models/appoinment_model.dart';

class AppointmentController {
  final ValueNotifier<int> selectedDateIndex = ValueNotifier(0);
  final ValueNotifier<int> selectedTimeIndex = ValueNotifier(0);

  late final List<AppointmentDate> dates;
  late final List<AppointmentTime> times;

  AppointmentController() {
    dates = AppointmentHelper.generateDates();
    times = AppointmentHelper.generateTimes();
  }

  AppointmentDate get selectedDate => dates[selectedDateIndex.value];
  AppointmentTime get selectedTime => times[selectedTimeIndex.value];

  void selectCustomDate(DateTime date) {
    final formatted = AppointmentDate(
      day: DateFormat('EEE').format(date).toUpperCase(),
      date: DateFormat('dd').format(date),
    );

    dates.insert(0, formatted);
    selectedDateIndex.value = 0;
  }

  void dispose() {
    selectedDateIndex.dispose();
    selectedTimeIndex.dispose();
  }
}
