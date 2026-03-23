import 'package:bloc_setup/core/common/app_bar.dart';
import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:bloc_setup/features/search/presentation/pages/search_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/widgets/circle_icon.dart';
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

  bool isShowAppoinment = false;

  final List<DealModel> deals = [
    DealModel(
      image:
          "assets/images/"
          "slider1.jpg",
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: Icon(
                  isDark ? Icons.dark_mode : Icons.light_mode,
                  color: AppColors.primary,
                ),
              ),
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
          circleIcon(Icons.notifications_outlined),
          HorizontalGap(8),
          circleIcon(Icons.person_outline_outlined),
          HorizontalGap(10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          AppTextField(
            controller: searchController,
            hintText: "Search for hair, nails, or spa...",
            prefixIcon: Icons.search,
            readOnly: true,
            iconColor: AppColors.primary,
            borderColor: AppColors.secondary,
            borderRadius: BorderRadius.circular(12),
            focusedBorderColor: AppColors.primary,
            validator: (value) => null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          VerticalGap(20),
          CarouselSlider(
            options: CarouselOptions(
              height: 170,
              viewportFraction: 0.9,
              enlargeCenterPage: false,
              autoPlay: false,
            ),
            items: deals.map((deal) {
              return BannerCard(
                width: screenWidth,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
          ServiceCard(
            image: "assets/featured_services/haircut.png",
            title: "Signature Haircut",
            subtitle: "Personalized cut...",
            price: "\$45",
            onBook: () => _openDialog(context),
          ),

          const SizedBox(height: 12),

          ServiceCard(
            image: "assets/featured_services/beard.png",
            title: "Beard Grooming",
            subtitle: "Trim & shape...",
            price: "\$25",
            onBook: () => _openDialog(context),
          ),
          VerticalGap(12),
          ServiceCard(
            image: "assets/featured_services/nails.png",
            title: "Gel Manicure",
            subtitle: "Long-lasting color with cuticle care",
            price: "\$35",
            onBook: () => _openDialog(context),
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
            images: const [
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
              setState(() {
                isShowAppoinment = true;
              });
            },
            onFavorite: () {},
          ),
          VerticalGap(10),
          StudioCard(
            images: const [
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
              setState(() {
                isShowAppoinment = true;
              });
            },
            onFavorite: () {},
          ),
          VerticalGap(15),
          isShowAppoinment
              ? AppointmentCard(
                  controller: controller,
                  onClose: () {
                    setState(() {
                      isShowAppoinment = false;
                    });
                  },
                )
              : SizedBox.shrink(),
        ],
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
      ],
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: AppointmentCard(
          controller: controller,
          onClose: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
