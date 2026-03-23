import 'package:flutter/material.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onBook;
  const ServiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background(context),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: ResizeImage(AssetImage(image), width: 120),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    weight: FontWeightOption.bold,
                    size: FontSize.M,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: subtitle,
                    size: FontSize.S,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: price,
                    color: AppColors.primary,
                    weight: FontWeightOption.bold,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            CustomIconButton(text: 'Book', onPressed: onBook),
          ],
        ),
      ),
    );
  }
}
