import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/theme/colors.dart';

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
        color: AppColors.background(context),
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 6,
        //     color: AppColors.textPrimary(context).withOpacity(.08),
        //     offset: const Offset(0, 6),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            child: PageView.builder(
              itemCount: images.length,
              controller: PageController(viewportFraction: 1),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ResizeImage(AssetImage(images[index]), width: 300),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.low,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: InkWell(
                        onTap: onFavorite,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.background(context),
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
                        onPressed: onViewDetails ?? () {},
                      ),
                    ),
                    HorizontalGap(10),
                    Expanded(
                      child: CustomIconButton(
                        text: "Book Now",
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
