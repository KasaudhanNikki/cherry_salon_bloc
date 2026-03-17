import 'package:bloc_setup/core/common/app_bar.dart';
import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../appoinment/presentation/controllers/appointment_controller.dart';
import '../../../appoinment/presentation/pages/appoinment_card.dart';
import '../widget/salon_card.dart';
import '../widget/service_card.dart';
import '../widget/banner_card.dart';
import '../../../salon_details/presentation/pages/salon_details.dart';
import '../../data/models/deal_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final searchController = TextEditingController();
  final controller = AppointmentController();

  final List<DealModel> deals = [
    DealModel(
      image: "assets/images/slider1.jpg",
      tag: "SUMMER DEAL",
      title: "20% Off All Haircuts",
      subtitle: "Valid until end of June",
    ),
    DealModel(
      image: "assets/images/slider2.jpg",
      tag: "NEW OFFER",
      title: "Free Beard Trim",
      subtitle: "With every haircut",
    ),
  ];

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.man, "title": "Men"},
    {"icon": Icons.woman, "title": "Women"},
    {"icon": Icons.child_care, "title": "Kids"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Icon(Icons.flare, color: AppColors.primary),
              HorizontalGap(10),
              AppText(
                text: "Cherry Salon",
                size: FontSize.L,
                weight: FontWeightOption.bold,
              ),
            ],
          ),
        ),
        actions: [
          _circleIcon(Icons.notifications_outlined),
          HorizontalGap(8),
          _circleIcon(Icons.person_outline_outlined),
          HorizontalGap(10),
        ],
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
                  hintText: "Search for hair, nails, or spa...",
                  prefixIcon: Icons.search,
                  iconColor: AppColors.primary,
                  borderColor: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  validator: (value) => null,
                ),
                VerticalGap(20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 170,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: deals.map((deal) {
                    return BannerCard(
                      width: MediaQuery.of(context).size.width,
                      image: deal.image,
                      tag: deal.tag,
                      title: deal.title,
                      subtitle: deal.subtitle,
                    );
                  }).toList(),
                ),
                VerticalGap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Categories",
                      size: FontSize.M,
                      weight: FontWeightOption.bold,
                    ),
                    AppText(
                      text: "View All",
                      size: FontSize.M,
                      weight: FontWeightOption.bold,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                VerticalGap(15),
                SizedBox(
                  height: 95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: 80,
                          child: _category(
                            categories[index]["icon"],
                            categories[index]["title"],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                VerticalGap(20),
                AppText(
                  text: "Featured Services",
                  size: FontSize.M,
                  weight: FontWeightOption.bold,
                ),
                VerticalGap(15),
                serviceCard(
                  "assets/featured_services/haircut.png",
                  "Signature Haircut",
                  "Personalized cut, wash & blow-dry...",
                  "\$45",
                ),
                VerticalGap(12),
                serviceCard(
                  "assets/featured_services/beard.png",
                  "Beard Grooming",
                  "Trim, shape and hot towel treatment",
                  "\$25",
                ),
                VerticalGap(12),
                serviceCard(
                  "assets/featured_services/nails.png",
                  "Gel Manicure",
                  "Long-lasting color with cuticle care",
                  "\$35",
                ),
                VerticalGap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Nearby Salons",
                      size: FontSize.M,
                      weight: FontWeightOption.bold,
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
                  onBookNow: () {},
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
                  onBookNow: () {},
                  onFavorite: () {},
                ),
                VerticalGap(15),
                AppointmentCard(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _category(IconData icon, String title) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 30, color: AppColors.primary),
        ),
        VerticalGap(6),
        AppText(text: title, size: FontSize.S),
        HorizontalGap(20),
      ],
    );
  }

  Widget _circleIcon(IconData icon) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: AppColors.secondary,
      child: Icon(icon, color: AppColors.primary, size: 18),
    );
  }
}
