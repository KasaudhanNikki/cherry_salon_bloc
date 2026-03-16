class AppointmentDate {
  final String day;
  final String date;
  const AppointmentDate({required this.day, required this.date});
}

class AppointmentTime {
  final String? label;
  const AppointmentTime({this.label});
  bool get isAvailable => label != null;
}