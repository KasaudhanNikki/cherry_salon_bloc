import 'package:bloc_setup/core/utils/gap.dart';
import 'package:bloc_setup/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/app_button.dart';
import '../../../../core/common/app_text.dart';
import '../../../../core/common/app_text_field.dart';
import '../../../../core/theme/colors.dart';
import '../../../../injection_container.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Success")));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
                (Route<dynamic> route) => false,
              );
            }
            if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalGap(80),
                  Center(
                    child: Image.asset(
                      "assets/images/cherry_salon_logo.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Center(
                    child: AppText(
                      text: "Cherry Salon",
                      size: FontSize.XL,
                      weight: FontWeightOption.bold,
                      color: AppColors.black,
                    ),
                  ),
                  VerticalGap(5),
                  Center(
                    child: AppText(
                      text: "Welcome Back!",
                      size: FontSize.M,
                      weight: FontWeightOption.medium,
                      color: AppColors.gray,
                    ),
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
                    hintText: "Enter Email",
                    prefixIcon: Icons.email_outlined,
                    iconColor: AppColors.primary,
                    borderColor: AppColors.secondary,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  VerticalGap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Password',
                        size: FontSize.M,
                        weight: FontWeightOption.medium,
                      ),
                      AppText(
                        text: 'Forget Password?',
                        size: FontSize.M,
                        weight: FontWeightOption.medium,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  VerticalGap(5),
                  AppTextField(
                    controller: passwordController,
                    hintText: "Enter Password",
                    prefixIcon: Icons.lock_outline,
                    iconColor: AppColors.primary,
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
                      isLoading: state is LoginLoading,
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      text: "Login",
                      icon: Icons.arrow_forward,
                      buttonColor: AppColors.primary,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      textSize: FontSize.M,
                      textWeight: FontWeightOption.semiBold,
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),
                  VerticalGap(20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.gray.withAlpha(100),
                          endIndent: 10,
                        ),
                      ),
                      AppText(text: 'Or continue with', color: AppColors.gray),
                      Expanded(
                        child: Divider(
                          height: 1,
                          color: AppColors.gray.withAlpha(100),
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  VerticalGap(15),
                  Center(
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  VerticalGap(12),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(fontSize: 16, color: AppColors.gray),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' SignUp',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
    // return BlocProvider(
    //   create: (_) => sl<LoginBloc>(),
    //   child: Scaffold(
    //     appBar: AppBar(title: const Text("Login")),
    //     body: Padding(
    //       padding: const EdgeInsets.all(20),
    //       child: BlocConsumer<LoginBloc, LoginState>(
    //         listener: (context, state) {
    //           if (state is LoginSuccess) {
    //             ScaffoldMessenger.of(
    //               context,
    //             ).showSnackBar(SnackBar(content: Text("Success")));
    //           }
    //           if (state is LoginError) {
    //             ScaffoldMessenger.of(
    //               context,
    //             ).showSnackBar(SnackBar(content: Text(state.message)));
    //           }
    //         },
    //         builder: (context, state) {
    //           return Column(
    //             children: [
    //               TextField(
    //                 controller: emailController,
    //                 decoration: const InputDecoration(labelText: "Email"),
    //               ),
    //               VerticalGap(15),
    //               TextField(
    //                 controller: passwordController,
    //                 obscureText: true,
    //                 decoration: const InputDecoration(labelText: "Password"),
    //               ),
    //               VerticalGap(20),
    //               if (state is LoginLoading)
    //                 const CircularProgressIndicator()
    //               else
    //                 ElevatedButton(
    //                   onPressed: () {
    //                     context.read<LoginBloc>().add(
    //                       LoginSubmitted(
    //                         email: emailController.text,
    //                         password: passwordController.text,
    //                       ),
    //                     );
    //                   },
    //                   child: const Text("Login"),
    //                 ),
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
