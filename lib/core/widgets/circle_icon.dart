import 'package:flutter/material.dart';
import '../theme/colors.dart';

Widget circleIcon(IconData icon) {
  return CircleAvatar(
    radius: 15,
    backgroundColor: AppColors.secondary,
    child: Icon(icon, color: AppColors.primary, size: 18),
  );
}