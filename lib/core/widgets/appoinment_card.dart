import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/data/models/appoinment_model.dart';
import '../theme/colors.dart';

class AppointmentController {
  final ValueNotifier<int> selectedDateIndex = ValueNotifier(0);
  final ValueNotifier<int> selectedTimeIndex = ValueNotifier(1);

  final List<AppointmentDate> dates;
  final List<AppointmentTime> times;

  AppointmentController({
    List<AppointmentDate>? dates,
    List<AppointmentTime>? times,
  })  : dates = dates ??
      const [
        AppointmentDate(day: 'MON', date: '12'),
        AppointmentDate(day: 'TUE', date: '13'),
        AppointmentDate(day: 'WED', date: '14'),
        AppointmentDate(day: 'THU', date: '15'),
        AppointmentDate(day: 'FRI', date: '16'),
      ],
        times = times ??
            const [
              AppointmentTime(label: '09:00 AM'),
              AppointmentTime(label: '10:30 AM'),
              AppointmentTime(label: null), // unavailable
              AppointmentTime(label: '01:30 PM'),
              AppointmentTime(label: '02:00 PM'),
              AppointmentTime(label: '04:30 PM'),
            ];

  AppointmentDate get selectedDate => dates[selectedDateIndex.value];
  AppointmentTime get selectedTime => times[selectedTimeIndex.value];

  void dispose() {
    selectedDateIndex.dispose();
    selectedTimeIndex.dispose();
  }
}

class AppointmentCard extends StatelessWidget {
  final AppointmentController controller;

  const AppointmentCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.primary.withAlpha(17),
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
                 Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.primary,
                  size: 24,
                ),
              ],
            ),
            VerticalGap(20),
            _SectionLabel(label: 'SELECT DATE'),
            VerticalGap(12),
            _DateRow(controller: controller),
            VerticalGap(20),
            _SectionLabel(label: 'SELECT TIME'),
            VerticalGap(12),
            _TimeGrid(controller: controller),
            VerticalGap(20),
            _ConfirmButton(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style:  TextStyle(
        color: AppColors.gray,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _DateRow extends StatelessWidget {
  final AppointmentController controller;
  const _DateRow({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) => ValueListenableBuilder<int>(
          valueListenable: controller.selectedDateIndex,
          builder: (context, selectedIndex, _) {
            final isSelected = selectedIndex == index;
            final item = controller.dates[index];
            return GestureDetector(
              onTap: () => controller.selectedDateIndex.value = index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: 60,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: item.day,
                      size: FontSize.XS,
                      weight: FontWeightOption.bold,
                      color: isSelected
                          ? AppColors.white
                          : AppColors.gray,
                    ),
                    VerticalGap(4),
                    Text(
                      item.date,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.secondary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─── Time Grid ────────────────────────────────────────────────────────────────
class _TimeGrid extends StatelessWidget {
  final AppointmentController controller;
  const _TimeGrid({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller.selectedTimeIndex,
      builder: (context, selectedIndex, _) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.6,
          ),
          itemCount: controller.times.length,
          itemBuilder: (context, index) {
            final slot = controller.times[index];
            final isDisabled = !slot.isAvailable;
            final isSelected = !isDisabled && selectedIndex == index;

            return GestureDetector(
              onTap: isDisabled
                  ? null
                  : () => controller.selectedTimeIndex.value = index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isDisabled
                      ? AppColors.gray
                      : isSelected
                      ? AppColors.primary
                      : AppColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  slot.label ?? '—',
                  style: TextStyle(
                    color: isDisabled
                        ? AppColors.gray
                        : isSelected
                        ? AppColors.primary
                        : AppColors.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ─── Confirm Button ───────────────────────────────────────────────────────────
class _ConfirmButton extends StatelessWidget {
  final AppointmentController controller;
  const _ConfirmButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          final date = controller.selectedDate;
          final time = controller.selectedTime;
          debugPrint('Booked: ${date.day} ${date.date} at ${time.label}');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.secondary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm Booking',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 20),
          ],
        ),
      ),
    );
  }
}