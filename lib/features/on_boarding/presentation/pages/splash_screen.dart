import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/theme/colors.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:flutter/material.dart';
import '../../../auth/presentation/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _progressAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_progressController)
          ..addListener(() {
            setState(() {});
          });

    _progressController.forward().then((_) {
      if (mounted) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFafa), Color(0xFFFEF2F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalGap(50),
            Center(
              child: Image.asset(
                "assets/images/cherry_salon_logo.png",
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            VerticalGap(12),
            AppText(
              text: "Cherry Salon",
              size: FontSize.XXL,
              weight: FontWeightOption.bold,
              color: AppColors.black,
            ),
            VerticalGap(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Align(
                alignment: Alignment.center,
                child: AppText(
                  text: "Your premium salon experience starts here.",
                  size: FontSize.M,
                  color: AppColors.black,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "INITIALIZING",
                        size: FontSize.M,
                        weight: FontWeightOption.bold,
                        color: AppColors.primary,
                      ),
                      AppText(
                        text: "${(_progressAnimation.value * 100).toInt()}%",
                        size: FontSize.S,
                        weight: FontWeightOption.bold,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  VerticalGap(12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: _progressAnimation.value,
                      minHeight: 6,
                      backgroundColor: AppColors.secondary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                  VerticalGap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.secondary,
                            width: 1.5,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
