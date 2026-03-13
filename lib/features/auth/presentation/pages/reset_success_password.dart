import 'package:bloc_setup/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_bar.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';

class ResetSuccessPassword extends StatefulWidget {
  const ResetSuccessPassword({super.key});

  @override
  State<ResetSuccessPassword> createState() => _ResetSuccessPasswordState();
}

class _ResetSuccessPasswordState extends State<ResetSuccessPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Reset Password"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              VerticalGap(150),
              Image.asset('assets/images/reset_password.png', height: 120),
              VerticalGap(20),
              AppText(
                text: "Password Reset Successful",
                size: FontSize.XXL,
                weight: FontWeightOption.bold,
              ),
              VerticalGap(8),
              AppText(
                text:
                    "Your password has been updated. You can now log in with your new credentials.",
                size: FontSize.M,
                color: AppColors.gray,
                align: TextAlign.center,
              ),
              VerticalGap(25),
              CustomIconButton(
                isLoading: false,
                width: MediaQuery.of(context).size.width,
                height: 45,
                text: "Back to login",
                buttonColor: AppColors.primary,
                textColor: Colors.white,
                textSize: FontSize.M,
                textWeight: FontWeightOption.semiBold,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
