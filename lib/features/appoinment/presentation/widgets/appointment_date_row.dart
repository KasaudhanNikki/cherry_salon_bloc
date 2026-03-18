import 'package:flutter/material.dart';

import '../controllers/appointment_controller.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';

class DateRow extends StatelessWidget {
  final AppointmentController controller;
  const DateRow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.dates.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
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
                  color: isSelected ? AppColors.primary :  AppColors.background(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: item.day,
                      size: FontSize.XS,
                      weight: FontWeightOption.bold,
                      color: isSelected ? AppColors.background(context) : AppColors.gray,
                    ),
                    AppText(
                      text: item.date,
                      color: isSelected ? AppColors.background(context) : AppColors.textPrimary(context),
                      size: FontSize.L,
                      weight: FontWeightOption.bold,
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
