import 'package:flutter/material.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 12,
      children: const [
        CustomChip(label: "Price"),
        CustomChip(label: "Distance"),
        CustomChip(label: "Rating"),
      ],
    );
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const CustomChip({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(text: label, color: AppColors.primary),
            const HorizontalGap(4),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 18,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
