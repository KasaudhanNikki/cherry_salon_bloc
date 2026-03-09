import 'package:bloc_setup/core/common/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText(
          text: "Dashboard",
          size: FontSize.L,
          weight: FontWeightOption.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
