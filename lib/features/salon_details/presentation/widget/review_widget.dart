import 'package:flutter/material.dart';

import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';

Widget buildReviewsSection(BuildContext context) {
  final reviews = [
    {
      "name": "Sarah Jenkins",
      "time": "2 days ago",
      "rating": 5,
      "comment":
          "The best haircut I've had in years! The atmosphere is so relaxing and the stylists are true professionals.",
    },
    {
      "name": "Michael Chen",
      "time": "1 week ago",
      "rating": 5,
      "comment":
          "Excellent service and very clean salon. The staff made me feel welcome from the moment I walked in.",
    },
    {
      "name": "Elena Rodriguez",
      "time": "2 weeks ago",
      "rating": 4,
      "comment":
          "Loved my color! It lasted so long and looks very natural. Only giving 4 stars because my appointment started late.",
    },
  ];

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildReviewHeader(context),
          VerticalGap(16),
          buildRatingSummary(context),
          VerticalGap(20),
          ...reviews.map((r) => buildReviewItem(context, r)),
          VerticalGap(16),
          buildViewAllButton(context),
        ],
      ),
    ),
  );
}

Widget buildReviewHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(
        text: 'Customer Reviews',
        weight: FontWeightOption.bold,
        size: FontSize.M,
        color: AppColors.textPrimary(context),
      ),
      InkWell(
        onTap: () {},
        child: AppText(
          text: 'Write a review',
          weight: FontWeightOption.bold,
          size: FontSize.M,
          color: AppColors.primary,
        ),
      ),
    ],
  );
}

Widget buildRatingSummary(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.secondary,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: '4.8',
              size: FontSize.XXXL,
              weight: FontWeightOption.bold,
              color: AppColors.primary,
            ),
            AppText(text: 'OUT OF 5', size: FontSize.S, color: AppColors.gray),
          ],
        ),
        HorizontalGap(20),
        Container(
          width: 1,
          height: 80,
          color: AppColors.primary.withOpacity(0.5),
        ),
        HorizontalGap(20),
        Expanded(
          child: Column(
            children: List.generate(5, (index) {
              int star = 5 - index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                      child: AppText(
                        text: '$star',
                        size: FontSize.S,
                        color: AppColors.gray,
                        weight: FontWeightOption.semiBold,
                      ),
                    ),
                    HorizontalGap(10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: _getProgressValue(star),
                          backgroundColor: AppColors.background(
                            context,
                          ).withOpacity(0.7),
                          color: AppColors.primary,
                          minHeight: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}

Widget buildReviewItem(BuildContext context, Map<String, dynamic> review) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 20),
            HorizontalGap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: review['name'],
                        weight: FontWeightOption.bold,
                        size: FontSize.M,
                        color: AppColors.textPrimary(context),
                      ),
                      AppText(
                        text: review['time'],
                        size: FontSize.S,
                        color: AppColors.gray,
                      ),
                    ],
                  ),
                  VerticalGap(4),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < review['rating'] ? Icons.star : Icons.star_border,
                        size: 16,
                        color: AppColors.primary,
                      );
                    }),
                  ),
                  VerticalGap(6),
                  AppText(
                    text: review['comment'],
                    size: FontSize.M,
                    color: AppColors.gray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Divider(color: AppColors.primary.withOpacity(0.4)),
    ],
  );
}

Widget buildViewAllButton(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: AppText(
        text: 'View All 240 Reviews',
        weight: FontWeightOption.bold,
        size: FontSize.M,
        color: AppColors.primary,
      ),
    ),
  );
}

double _getProgressValue(int star) {
  switch (star) {
    case 5:
      return 0.9;
    case 4:
      return 0.7;
    case 3:
      return 0.5;
    case 2:
      return 0.3;
    case 1:
      return 0.2;
    default:
      return 0.0;
  }
}
