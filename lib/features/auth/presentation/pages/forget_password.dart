import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/core/theme/colors.dart';
import 'package:bloc_setup/core/utils/gap.dart';
import 'package:bloc_setup/features/auth/presentation/pages/login_page.dart';
import 'package:bloc_setup/features/auth/presentation/pages/reset_password.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_bar.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Forgot Password"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/forget_password.png')),
            VerticalGap(20),
            AppText(
              text: "Forgot Password?",
              size: FontSize.XXL,
              weight: FontWeightOption.bold,
            ),
            VerticalGap(10),
            AppText(
              text:
                  "No worries! Enter your email address below and we'll send you a link to reset your password.",
              size: FontSize.M,
              color: AppColors.gray,
            ),
            VerticalGap(20),
            AppText(
              text: 'Email Address',
              size: FontSize.M,
              weight: FontWeightOption.medium,
            ),
            VerticalGap(5),
            AppTextField(
              controller: emailController,
              hintText: "you@gmail.com",
              prefixIcon: Icons.email,
              iconColor: AppColors.gray,
              borderColor: AppColors.secondary,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                return null;
              },
            ),
            VerticalGap(25),
            CustomIconButton(
              isLoading: false,
              width: MediaQuery.of(context).size.width,
              height: 45,
              text: "Send Reset Link",
              buttonColor: AppColors.primary,
              textColor: Colors.white,
              textSize: FontSize.M,
              textWeight: FontWeightOption.semiBold,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassword()),
                );
              },
            ),
            VerticalGap(150),
            Divider(),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                label: AppText(text: "Back to login", color: AppColors.primary),
                icon: Icon(Icons.arrow_back, color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
