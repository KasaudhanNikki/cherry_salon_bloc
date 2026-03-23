import 'package:flutter/material.dart';
import '../controllers/appointment_controller.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';

class DateRow extends StatelessWidget {
  final AppointmentController controller;
  const DateRow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.background(context);
    return ValueListenableBuilder<int>(
      valueListenable: controller.selectedDateIndex,
      builder: (context, selectedIndex, _) {
        return SizedBox(
          height: 72,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dates.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              final item = controller.dates[index];

              return InkWell(
                onTap: () => controller.selectedDateIndex.value = index,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: item.day,
                        size: FontSize.XS,
                        weight: FontWeightOption.bold,
                        color: isSelected ? bgColor : AppColors.gray,
                      ),
                      AppText(
                        text: item.date,
                        size: FontSize.L,
                        weight: FontWeightOption.bold,
                        color: isSelected
                            ? bgColor
                            : AppColors.textPrimary(context),
                      ),
                    ],
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
