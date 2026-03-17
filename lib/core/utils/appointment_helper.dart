import 'package:intl/intl.dart';
import '../../features/appoinment/data/models/appoinment_model.dart';

class AppointmentHelper {
  static List<AppointmentDate> generateDates() {
    final now = DateTime.now();

    return List.generate(5, (index) {
      final date = now.add(Duration(days: index));

      return AppointmentDate(
        day: DateFormat('EEE').format(date).toUpperCase(),
        date: DateFormat('dd').format(date),
      );
    });
  }

  static List<AppointmentTime> generateTimes() {
    final now = DateTime.now();

    return List.generate(6, (index) {
      final time = now.add(Duration(minutes: 60 * index));

      return AppointmentTime(label: DateFormat('hh:mm a').format(time));
    });
  }
}
