import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/common/app_bar.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int rating = 4;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: CustomAppBar(title: "Write Review"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                buildSalonInfo(context),
                VerticalGap(10),
                buildRatingSection(context),
                buildReviewInput(context, reviewController),
                VerticalGap(10),
                buildPhotoSection(context),
                VerticalGap(15),
                buildChipsSection(context),
                buildSubmitButton(context),
                VerticalGap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSalonInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/salon_images/salon3.png",
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          HorizontalGap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Cherry Salon",
                weight: FontWeightOption.bold,
                size: FontSize.M,
                color: AppColors.textPrimary(context),
              ),
              AppText(text: "Hair, Nails & Spa", color: AppColors.primary),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: AppColors.primary),
                  AppText(
                    text: " Downtown, New York",
                    size: FontSize.S,
                    color: AppColors.gray,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRatingSection(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: "How was your experience?",
          weight: FontWeightOption.bold,
          size: FontSize.M,
          color: AppColors.textPrimary(context),
        ),
        VerticalGap(6),
        AppText(
          text: "Tap to rate your visit",
          size: FontSize.S,
          color: AppColors.gray,
        ),
        VerticalGap(12),

        RatingBar.builder(
          initialRating: rating.toDouble(),
          minRating: 1,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 36,
          itemBuilder: (context, _) =>
              Icon(Icons.star, color: AppColors.primary),
          onRatingUpdate: (value) {
            setState(() {
              rating = value.toInt();
            });
          },
        ),
      ],
    );
  }

  Widget buildReviewInput(
    BuildContext context,
    TextEditingController reviewController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: "YOUR REVIEW", size: FontSize.S, color: AppColors.gray),
        VerticalGap(8),
        AppTextField(
          maxLines: 5,
          minLines: 2,
          controller: reviewController,
          hintText:
              "Tell us about your hair stylist, the atmosphere, or the service you received...",
          borderColor: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
          focusedBorderColor: AppColors.primary,
          validator: (value) => null,
        ),
      ],
    );
  }

  Widget buildPhotoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: "ADD PHOTOS (OPTIONAL)",
          size: FontSize.S,
          color: AppColors.gray,
        ),
        VerticalGap(10),
        Row(
          children: [
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: [10, 5],
                strokeWidth: 2,
                padding: EdgeInsets.all(16),
                color: AppColors.primary,
                radius: Radius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, color: AppColors.primary),
                  AppText(
                    text: "ADD PHOTO",
                    size: FontSize.S,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            HorizontalGap(12),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/salon_images/salon3.png",
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.primary,
                    child: const Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildChipsSection(BuildContext context) {
    final items = [
      "Great Ambiance",
      "Expert Stylists",
      "Cleanliness",
      "Good Value",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: "WHAT DID YOU LOVE?",
          size: FontSize.S,
          color: AppColors.gray,
        ),
        VerticalGap(10),

        Wrap(
          runSpacing: 10,
          children: items.map((e) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary),
              ),
              child: AppText(
                text: e,
                size: FontSize.S,
                color: AppColors.primary,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Submit Review ➤",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          VerticalGap(8),
          AppText(
            text:
                "By submitting, you agree to our Community Guidelines and Terms of Service.",
            size: FontSize.S,
            color: AppColors.gray,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
