import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/appointment_date_row.dart';
import '../../../../core/widgets/section_labels.dart';
import '../../data/models/appoinment_model.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/theme/colors.dart';
import '../controllers/appointment_controller.dart';
import '../widgets/appointment_time_grid.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentController controller;
  final VoidCallback onClose;
  const AppointmentCard({
    super.key,
    required this.controller,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.secondary.withAlpha(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Appointment',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
                InkWell(
                  onTap: onClose,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.close, color: AppColors.background(context), size: 18),
                  ),
                ),
              ],
            ),
            VerticalGap(20),
            SectionLabel(label: 'SELECT DATE'),
            VerticalGap(12),
            DateRow(controller: controller),
            VerticalGap(10),
            GestureDetector(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );

                if (pickedDate != null) {
                  controller.selectCustomDate(pickedDate);
                }
              },
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 6),
                  AppText(
                    text: "Choose from calendar",
                    color: AppColors.primary,
                    size: FontSize.S,
                    weight: FontWeightOption.semiBold,
                  ),
                ],
              ),
            ),
            VerticalGap(20),
            SectionLabel(label: 'SELECT TIME'),
            VerticalGap(12),
            TimeGrid(controller: controller),
            VerticalGap(20),
            CustomIconButton(
              isLoading: false,
              width: MediaQuery.of(context).size.width,
              height: 45,
              text: 'Confirm Booking',
              icon: Icons.arrow_forward,
              onPressed: () {
                final date = controller.selectedDate;
                final time = controller.selectedTime;
                debugPrint('Booked: ${date.day} ${date.date} at ${time.label}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
