import 'package:bloc_setup/core/common/app_bar.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/location_card.dart';

class SalonDetails extends StatefulWidget {
  const SalonDetails({super.key});

  @override
  State<SalonDetails> createState() => _SalonDetailsState();
}

class _SalonDetailsState extends State<SalonDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: "Salon Details",
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: AppColors.black, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/salon_images/salon3.png"),
            _buildSalonHeader(),
            _buildTabBar(),
            _buildServicesSection(),
            _buildLocationSection(),
            _buildHoursSection(),
            VerticalGap(32),
          ],
        ),
      ),
    );
  }

  Widget _buildSalonHeader() {
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

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primary,
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            tabs: const [
              Tab(text: 'Services'),
              Tab(text: 'About'),
              Tab(text: 'Reviews'),
            ],
          ),
          const Divider(height: 0, thickness: 1, color: Color(0xFFEEEEEE)),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: AppText(
              text:
                  'dedicated to bringing out your best look with personalized care and top-tier products.',
              color: AppColors.gray,
              weight: FontWeightOption.bold,
              size: FontSize.M,
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Popular Services',
            weight: FontWeightOption.bold,
            size: FontSize.M,
            color: AppColors.black,
          ),
          VerticalGap(12),
          ..._services.map((s) => _buildServiceCard(s)),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
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

  Widget _buildLocationSection() {
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

  Widget _buildHoursSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
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
                color: AppColors.black,
              ),
            ],
          ),
          VerticalGap(12),
          ..._hours.map((h) => _buildHourRow(h['day']!, h['time']!)),
        ],
      ),
    );
  }

  Widget _buildHourRow(String day, String time) {
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
}
