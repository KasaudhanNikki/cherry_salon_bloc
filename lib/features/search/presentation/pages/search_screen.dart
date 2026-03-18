import 'package:flutter/material.dart';
import '../../../../core/common/app_bar.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';
import '../../../../core/widgets/circle_icon.dart';
import '../../../appoinment/presentation/controllers/appointment_controller.dart';
import '../../../appoinment/presentation/pages/appoinment_card.dart';
import '../../../dashboard/presentation/widget/salon_card.dart';
import '../../../salon_details/presentation/pages/salon_details.dart';
import '../widgets/filter_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Screen',
        actions: [circleIcon(Icons.person_outline_outlined), HorizontalGap(10)],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  controller: searchController,
                  hintText: "Search location or salon name",
                  prefixIcon: Icons.search,
                  iconColor: AppColors.primary,
                  borderColor: AppColors.secondary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  validator: (value) => null,
                  onChanged: (value) {},
                ),
                VerticalGap(15),
                FilterWidget(),
                VerticalGap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Nearby Salons",
                      size: FontSize.M,
                      weight: FontWeightOption.semiBold,
                    ),
                    AppText(
                      text: "See All",
                      size: FontSize.M,
                      weight: FontWeightOption.bold,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                VerticalGap(15),
                StudioCard(
                  images: [
                    "assets/salon_images/salon1.png",
                    "assets/salon_images/salon2.png",
                  ],
                  title: "Velvet Rose Studio",
                  location: "Downtown",
                  distance: "2.4 miles away",
                  rating: 4.8,
                  onViewDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SalonDetails()),
                    );
                  },
                  onBookNow: () {
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
                  onFavorite: () {},
                ),
                VerticalGap(10),
                StudioCard(
                  images: [
                    "assets/salon_images/salon3.png",
                    "assets/salon_images/salon2.png",
                    "assets/salon_images/salon1.png",
                  ],
                  title: "The Crimson Curl",
                  location: "WestEnd",
                  distance: "0.8 miles away",
                  rating: 2.8,
                  onViewDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SalonDetails()),
                    );
                  },
                  onBookNow: () {
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

                  onFavorite: () {},
                ),
                VerticalGap(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
