import 'package:flutter/material.dart';
import '../common/app_text.dart';
import '../theme/colors.dart';

class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: label,
      size: FontSize.S,
      weight: FontWeightOption.bold,
      color: AppColors.gray,
    );
  }
}
