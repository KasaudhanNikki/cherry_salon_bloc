import 'package:flutter/material.dart';
import '../common/app_text.dart';
import '../theme/colors.dart';
import '../utils/gap.dart';
import 'location_card.dart';

Widget buildServiceCard(Map<String, dynamic> service) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: service['name'],
                weight: FontWeightOption.bold,
                size: FontSize.M,
                color: AppColors.black,
              ),
              VerticalGap(4),
              AppText(
                text: service['desc'],
                weight: FontWeightOption.bold,
                size: FontSize.M,
                color: AppColors.gray,
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
              VerticalGap(8),
              AppText(
                text: service['price'],
                weight: FontWeightOption.bold,
                size: FontSize.M,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
        HorizontalGap(12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Book',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}


Widget buildLocationSection() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.primary,
              size: 22,
            ),
            HorizontalGap(6),
            AppText(
              text: 'Location',
              weight: FontWeightOption.bold,
              size: FontSize.M,
              color: AppColors.black,
            ),
          ],
        ),
        VerticalGap(12),
        LocationCard(),
        VerticalGap(8),
      ],
    ),
  );
}

Widget buildSalonHeader() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF8B1A2A),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.spa_outlined, color: Colors.white, size: 32),
          ),
        ),
        HorizontalGap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Velvet Rose Studio',
                weight: FontWeightOption.bold,
                size: FontSize.M,
                color: AppColors.black,
              ),
              VerticalGap(2),
              AppText(
                text: 'Luxury Hair & Beauty Salon',
                weight: FontWeightOption.bold,
                size: FontSize.M,
                color: AppColors.primary,
              ),
              VerticalGap(6),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  HorizontalGap(4),
                  AppText(
                    text: '4.8',
                    weight: FontWeightOption.bold,
                    size: FontSize.M,
                    color: AppColors.black,
                  ),
                  HorizontalGap(4),
                  AppText(
                    text: '(240 reviews)',
                    weight: FontWeightOption.bold,
                    size: FontSize.M,
                    color: AppColors.gray,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildHourRow(String day, String time) {
  final bool isClosed = time == 'Closed';
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: day,
          weight: FontWeightOption.bold,
          size: FontSize.M,
          color: AppColors.black,
        ),
        AppText(
          text: time,
          weight: FontWeightOption.bold,
          size: FontSize.M,
          color: isClosed ? AppColors.primary : AppColors.black,
        ),
      ],
    ),
  );
}