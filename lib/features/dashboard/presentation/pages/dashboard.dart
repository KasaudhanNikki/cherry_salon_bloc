import 'package:bloc_setup/core/common/app_bar.dart';
import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/carousel_widget.dart';
import '../../data/models/deal_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.flare, color: AppColors.primary),
              HorizontalGap(12),
              AppText(
                text: "Cherry Salon",
                size: FontSize.L,
                weight: FontWeightOption.bold,
              ),
            ],
          ),
        ),
        centerTitle: false,
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.secondary,
            child: Icon(
              Icons.notifications_outlined,
              color: AppColors.primary,
              size: 18,
            ),
          ),
          HorizontalGap(8),
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.secondary,
            child: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.primary,
              size: 18,
            ),
          ),
        ],
        padding: EdgeInsets.only(right: 15),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Column(
          children: [
            AppTextField(
              controller: searchController,
              hintText: "Search for hair, nails,or spa...",
              prefixIcon: Icons.search,
              iconColor: AppColors.primary,
              borderColor: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
              validator: (value) {
                return null;
              },
            ),
            VerticalGap(20),
            CarouselSlider(
              options: CarouselOptions(
                height: 170,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.linear,
              ),
              items: deals.map((deal) {
                return DealCard(
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
            VerticalGap(10),
          ],
        ),
      ),
    );
  }
}
