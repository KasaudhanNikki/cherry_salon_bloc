import 'package:flutter/material.dart';
import '../common/app_text.dart';
import '../theme/colors.dart';
import '../utils/gap.dart';

Widget serviceCard(
    String image,
    String title,
    String subtitle,
    String price,
    ) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(blurRadius: 8, color: Colors.black12, offset: Offset(0, 3)),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, height: 60, width: 60, fit: BoxFit.cover),
        ),
        HorizontalGap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: title,
                weight: FontWeightOption.bold,
                size: FontSize.M,
              ),
              VerticalGap(4),
              AppText(
                text: subtitle,
                size: FontSize.S,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
              VerticalGap(4),
              AppText(
                text: price,
                color: AppColors.primary,
                weight: FontWeightOption.bold,
              ),
            ],
          ),
        ),
        HorizontalGap(10),
        SizedBox(
          width: 75,
          height: 38,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text("Book", style: TextStyle(color: AppColors.white)),
          ),
        ),
      ],
    ),
  );
}