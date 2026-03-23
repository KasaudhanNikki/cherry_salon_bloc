import 'package:flutter/material.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../controllers/appointment_controller.dart';

class TimeGrid extends StatelessWidget {
  final AppointmentController controller;
  const TimeGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.background(context);
    return ValueListenableBuilder<int>(
      valueListenable: controller.selectedTimeIndex,
      builder: (context, selectedIndex, _) {
        return RepaintBoundary(
          child: GridView.builder(
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
              return InkWell(
                onTap: isDisabled
                    ? null
                    : () => controller.selectedTimeIndex.value = index,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isDisabled
                        ? AppColors.gray.withOpacity(0.2)
                        : isSelected
                        ? AppColors.primary
                        : bgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: AppText(
                    text: slot.label ?? '—',
                    color: isDisabled
                        ? AppColors.gray
                        : isSelected
                        ? bgColor
                        : AppColors.textPrimary(context),
                    size: FontSize.S,
                    weight: FontWeightOption.semiBold,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
