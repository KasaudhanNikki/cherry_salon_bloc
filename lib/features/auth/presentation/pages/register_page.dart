import 'package:bloc_setup/core/utils/gap.dart';
import 'package:bloc_setup/features/auth/presentation/bloc/login_state.dart';
import 'package:bloc_setup/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/app_bar.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../injection_container.dart';
import '../../../dashboard/presentation/pages/dashboard.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RegisterBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(title: "Create Account"),
        body: BlocConsumer<RegisterBloc, LoginState>(
          listener: (context, state) {
            if (state is Success) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Success")));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
                (Route<dynamic> route) => false,
              );
            }
            if (state is Error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Create Your Account",
                    size: FontSize.XXL,
                    weight: FontWeightOption.bold,
                  ),
                  VerticalGap(8),
                  AppText(
                    text: "Join us for a premium salon experience.",
                    color: AppColors.gray,
                  ),
                  VerticalGap(20),
                  AppText(
                    text: 'Full Name',
                    size: FontSize.M,
                    weight: FontWeightOption.medium,
                  ),
                  VerticalGap(7),
                  AppTextField(
                    controller: nameController,
                    hintText: "Enter your full name",
                    prefixIcon: Icons.person_2_outlined,
                    iconColor: AppColors.gray,
                    borderColor: AppColors.gray,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "name is required";
                      }
                      return null;
                    },
                  ),
                  VerticalGap(12),
                  AppText(
                    text: 'Email',
                    size: FontSize.M,
                    weight: FontWeightOption.medium,
                  ),
                  VerticalGap(5),
                  AppTextField(
                    controller: emailController,
                    hintText: "Enter your email address",
                    prefixIcon: Icons.email_outlined,
                    iconColor: AppColors.gray,
                    borderColor: AppColors.gray,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  VerticalGap(12),
                  AppText(
                    text: 'Phone Number',
                    size: FontSize.M,
                    weight: FontWeightOption.medium,
                  ),
                  VerticalGap(5),
                  AppTextField(
                    controller: phoneController,
                    hintText: "Enter your phone number",
                    prefixIcon: Icons.phone,
                    iconColor: AppColors.gray,
                    borderColor: AppColors.gray,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      }
                      return null;
                    },
                  ),
                  VerticalGap(12),
                  AppText(
                    text: 'Password',
                    size: FontSize.M,
                    weight: FontWeightOption.medium,
                  ),
                  VerticalGap(5),
                  AppTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    prefixIcon: Icons.lock_open_outlined,
                    iconColor: AppColors.gray,
                    borderColor: AppColors.gray,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  VerticalGap(25),
                  CustomIconButton(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    text: "Sign Up",
                    buttonColor: AppColors.primary,
                    textColor: Colors.white,
                    textSize: FontSize.M,
                    textWeight: FontWeightOption.semiBold,
                    onPressed: () {
                      context.read<RegisterBloc>().add(
                        RegisterSubmitted(
                          username: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        ),
                      );
                    },
                  ),
                  VerticalGap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Already have an account?",
                        color: AppColors.gray,
                        size: FontSize.M,
                      ),
                      HorizontalGap(2),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: AppText(
                          text: ' Log In',
                          color: AppColors.primary,
                          size: FontSize.L,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
