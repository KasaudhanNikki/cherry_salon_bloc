import 'package:bloc_setup/core/common/app_bar.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../widget/review_widget.dart';
import '../widget/salon_widgets.dart';

class SalonDetails extends StatefulWidget {
  const SalonDetails({super.key});

  @override
  State<SalonDetails> createState() => _SalonDetailsState();
}

class _SalonDetailsState extends State<SalonDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _services = [
    {
      'name': 'Signature Haircut',
      'desc': 'Includes wash, scalp massage, and style.',
      'price': '\$65.00',
    },
    {
      'name': 'Full Hair Coloring',
      'desc': 'Premium organic dyes with vibrant finish.',
      'price': '\$120.00',
    },
    {
      'name': 'Luxury Manicure',
      'desc': 'Gel polish with exfoliating hand treatment.',
      'price': '\$45.00',
    },
  ];

  final List<Map<String, String>> _hours = [
    {'day': 'Monday – Friday', 'time': '09:00 AM – 08:00 PM'},
    {'day': 'Saturday', 'time': '10:00 AM – 06:00 PM'},
    {'day': 'Sunday', 'time': 'Closed'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: CustomAppBar(
        title: "Salon Details",
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: AppColors.textPrimary(context),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset("assets/salon_images/salon3.png"),
                buildSalonHeader(context),
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [_servicesTab(), _aboutTab(), _reviewsTab()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textSecondary(context),
      indicatorColor: AppColors.primary,
      indicatorWeight: 2.5,
      tabs: const [
        Tab(text: 'Services'),
        Tab(text: 'About'),
        Tab(text: 'Reviews'),
      ],
    );
  }

  Widget _servicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text:
                "Welcome to Velvet Rose Studio — your go-to destination for stylish haircuts, grooming, and beauty care. "
                "Our team is passionate about helping you look your best with services designed just for you."
                "\nDedicated to bringing out your best look with personalized care and top-tier products.",
            size: FontSize.S,
            weight: FontWeightOption.semiBold,
            color: AppColors.textSecondary(context),
          ),
          VerticalGap(16),
          AppText(
            text: 'Popular Services',
            weight: FontWeightOption.bold,
            size: FontSize.M,
            color: AppColors.textPrimary(context),
          ),
          VerticalGap(12),

          ..._services.map((s) => buildServiceCard(context, s)),
        ],
      ),
    );
  }

  Widget _aboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AppText(
            text:
                'At Velvet Rose Studio, we specialize in delivering premium hair and beauty services tailored to your style. Our experienced professionals use high-quality products to ensure you leave feeling confident and refreshed.'
                '\nExperience luxury and elegance at Velvet Rose Studio. From precision haircuts to rejuvenating beauty treatments, we are dedicated to enhancing your natural beauty with personalized care and expert techniques.'
                '',
            size: FontSize.S,
            weight: FontWeightOption.semiBold,
            color: AppColors.textSecondary(context),
          ),
          VerticalGap(16),
          buildLocationSection(context),
          VerticalGap(20),
          _buildHoursSection(),
        ],
      ),
    );
  }

  Widget _reviewsTab() {
    return buildReviewsSection(context);
  }

  Widget _buildHoursSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              color: AppColors.primary,
              size: 20,
            ),
            HorizontalGap(6),
            AppText(
              text: 'Opening Hours',
              weight: FontWeightOption.bold,
              size: FontSize.M,
              color: AppColors.textPrimary(context),
            ),
          ],
        ),
        VerticalGap(12),
        ..._hours.map((h) => buildHourRow(context, h['day']!, h['time']!)),
      ],
    );
  }
}
