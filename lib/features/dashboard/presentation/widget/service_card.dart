import 'package:flutter/material.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';
import '../../../appoinment/presentation/controllers/appointment_controller.dart';
import '../../../appoinment/presentation/pages/appoinment_card.dart';

Widget serviceCard(
    String image,
    String title,
    String subtitle,
    String price,
    BuildContext context
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
        CustomIconButton(
          text: 'Book',
          onPressed: () {
            final controller = AppointmentController();
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (dialogContext) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  insetPadding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: AppointmentCard(
                      controller: controller,
                      onClose: () {
                        Navigator.pop(dialogContext);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    ),
  );
}