import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Auth/cubit/auth_cubit.dart';
import 'package:luxora_app/features/Auth/cubit/auth_states.dart';
import 'package:luxora_app/features/Auth/view/signup_screen.dart';
import 'package:luxora_app/features/Auth/widget/custom_button.dart';
import 'package:luxora_app/features/Auth/widget/custom_text_field.dart';
import 'package:luxora_app/features/Home/view/home_screen.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          }

          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.shade800,
                behavior: SnackBarBehavior.floating,
                elevation: 5,
                content: Text(state.message),
              ),
            );
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "LUXORA", size: 30),

              Divider(
                color: AppColors.divider,
                indent: 160,
                endIndent: 160,
                thickness: 2,
              ),
              Gap(4),
              CustomText(
                text: "TIMELESS STYLE. EFFORTLESS ELEGANCE.",
                color: AppColors.secondry,
                size: 14,
              ),
              Card(
                margin: EdgeInsets.all(30),
                color: Colors.white,
                elevation: 8,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Welcome Back", size: 24),
                      CustomText(
                        text: "Sign in to discover your next favorite piece.",
                        color: AppColors.secondry,
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                      Gap(24),
                      CustomTextField(
                        hint: "name@domain.com",
                        label: "Email Address",
                        prefixIcon: CupertinoIcons.mail,
                        controller: emailController,
                      ),
                      Gap(16),
                      CustomTextField(
                        prefixIcon: CupertinoIcons.lock,
                        hint: "********",
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: CustomText(text: "Forget Password?", size: 14),
                        ),
                      ),
                      Gap(24),
                      BlocBuilder<AuthCubit, AuthStates>(
                        builder: (context, state) {
                          return CustomButton(
                            text: state is LoginLoading ? "Loading" : "Sign in",
                            onpressed: () {
                              state is LoginLoading
                                  ? null
                                  : context.read<AuthCubit>().login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                            },
                          );
                        },
                      ),
                      Gap(28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Don't have an account?",
                            size: 13,
                            color: AppColors.secondry,
                          ),
                          Gap(4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignupScreen();
                                  },
                                ),
                              );
                            },
                            child: CustomText(text: "Create Account", size: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
