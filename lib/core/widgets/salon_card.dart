import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import '../common/app_button.dart';
import '../theme/colors.dart';

class StudioCard extends StatelessWidget {
  final List<String> images;
  final String title;
  final String location;
  final String distance;
  final double rating;
  final VoidCallback? onViewDetails;
  final VoidCallback? onBookNow;
  final VoidCallback? onFavorite;

  const StudioCard({
    super.key,
    required this.images,
    required this.title,
    required this.location,
    required this.distance,
    required this.rating,
    this.onViewDetails,
    this.onBookNow,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: AppColors.black.withOpacity(.08),
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        images[index],
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: InkWell(
                        onTap: onFavorite,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        text: title,
                        size: FontSize.M,
                        weight: FontWeightOption.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: AppColors.primary, size: 16),
                          HorizontalGap(4),
                          AppText(
                            text: rating.toString(),
                            weight: FontWeightOption.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                VerticalGap(6),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: AppColors.primary),
                    HorizontalGap(4),
                    AppText(
                      text: "$distance • $location",
                      color: AppColors.gray,
                    ),
                  ],
                ),
                VerticalGap(16),
                Row(
                  children: [
                    Expanded(
                      child: CustomIconButton(
                        text: "View Details",
                        buttonType: ButtonType.outlined,
                        buttonColor: AppColors.primary,
                        textColor: AppColors.primary,
                        onPressed: onViewDetails ?? () {},
                      ),
                    ),
                    HorizontalGap(10),
                    Expanded(
                      child: CustomIconButton(
                        text: "Book Now",
                        buttonColor: AppColors.primary,
                        textColor: AppColors.white,
                        onPressed: onBookNow ?? () {},
                      ),
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
}
