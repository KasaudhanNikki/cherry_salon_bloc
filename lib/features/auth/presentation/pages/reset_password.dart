import 'package:bloc_setup/core/common/app_text.dart';
import 'package:bloc_setup/features/auth/presentation/pages/reset_success_password.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/app_bar.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/gap.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Reset Password"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/forget_password.png',
              height: 120,
              cacheWidth: 300,
              filterQuality: FilterQuality.low,
            ),
            const VerticalGap(20),
            AppText(
              text: "Reset Password",
              size: FontSize.XXL,
              weight: FontWeightOption.bold,
            ),
            const VerticalGap(8),
            AppText(
              text:
                  "Create a new password for your account. Make sure it's strong and unique.",
              size: FontSize.M,
              color: AppColors.gray,
            ),
            const VerticalGap(25),
            AppText(text: "New Password", weight: FontWeightOption.medium),
            const VerticalGap(8),
            AppTextField(
              controller: newPassword,
              hintText: "Enter new password",
              prefixIcon: Icons.lock_outline,
              obscureText: !_showNewPassword,
              iconColor: AppColors.gray,
              borderColor: AppColors.secondary,
              suffixIcon: _showNewPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              onSuffixTap: () {
                setState(() {
                  _showNewPassword = !_showNewPassword;
                });
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            const VerticalGap(10),
            passwordStrength(newPassword.text),
            const VerticalGap(20),
            AppText(text: "Confirm Password", weight: FontWeightOption.medium),
            const VerticalGap(8),
            AppTextField(
              controller: confirmPassword,
              hintText: "Enter confirm password",
              prefixIcon: Icons.lock_outline,
              obscureText: !_showConfirmPassword,
              iconColor: AppColors.gray,
              borderColor: AppColors.secondary,
              suffixIcon: _showConfirmPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              onSuffixTap: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
            ),
            const VerticalGap(25),
            CustomIconButton(
              isLoading: false,
              width: double.infinity,
              height: 45,
              text: "Reset Password",
              onPressed:
                  (newPassword.text.isEmpty || confirmPassword.text.isEmpty)
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      if (newPassword.text.isEmpty ||
                          confirmPassword.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                        return;
                      }
                      if (newPassword.text != confirmPassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Passwords do not match"),
                          ),
                        );
                        return;
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetSuccessPassword(),
                        ),
                      );
                    },
            ),
            const VerticalGap(20),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "Having trouble? ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "Contact Support",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordStrength(String password) {
    int strength = 0;

    if (password.length >= 8) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    Color getColor() {
      if (strength <= 1) return Colors.red;
      if (strength <= 3) return Colors.orange;
      return Colors.green;
    }

    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            height: 5,
            decoration: BoxDecoration(
              color: index < strength ? getColor() : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
