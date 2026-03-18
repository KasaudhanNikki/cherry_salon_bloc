import 'package:bloc_setup/core/common/app_bar.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../widget/salon_widgets.dart';

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
      backgroundColor: AppColors.background(context),
      appBar: CustomAppBar(
        title: "Salon Details",
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: AppColors.textPrimary(context), size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/salon_images/salon3.png"),
            buildSalonHeader(context),
            _buildTabBar(),
            _buildServicesSection(),
            buildLocationSection(context),
            _buildHoursSection(context),
            VerticalGap(32),
          ],
        ),
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
            color: AppColors.textPrimary(context),
          ),
          VerticalGap(12),
          ..._services.map((s) => buildServiceCard(context, s)),
        ],
      ),
    );
  }

  Widget _buildHoursSection(BuildContext context) {
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
                color: AppColors.textPrimary(context),
              ),
            ],
          ),
          VerticalGap(12),
          ..._hours.map((h) => buildHourRow(context,h['day']!, h['time']!)),
        ],
      ),
    );
  }
}
