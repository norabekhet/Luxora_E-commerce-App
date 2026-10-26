import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Auth/cubit/auth_cubit.dart';
import 'package:luxora_app/features/Auth/cubit/auth_states.dart';
import 'package:luxora_app/features/Auth/view/login_screen.dart';
import 'package:luxora_app/features/Auth/view/verify_email_screen.dart';
import 'package:luxora_app/features/Auth/widget/custom_button.dart';
import 'package:luxora_app/features/Auth/widget/custom_text_field.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return VerifyEmailScreen(
                      email: emailController.text.trim(),
                    );
                  },
                ),
              );
            } else if (state is SignupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red.shade900,
                  behavior: SnackBarBehavior.floating,
                  elevation: 5,
                  content: Text(state.message),
                ),
              );
            }
          },
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
                text: "Timeless style. Effortless elegance.",
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
                      CustomText(text: "Create Your Account", size: 24),
                      CustomText(
                        text: "Join LUXORA and discover timeless elegance.",
                        color: AppColors.secondry,
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                      Gap(24),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hint: "Eleanor",
                              label: "First Name",
                              controller: firstNameController,
                            ),
                          ),
                          Gap(12),
                          Expanded(
                            child: CustomTextField(
                              hint: "Vance",
                              label: "Last Name",
                              controller: lastNameController,
                            ),
                          ),
                        ],
                      ),
                      Gap(16),
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
                        isPassword: true,
                        controller: passwordController,
                      ),

                      Gap(24),
                      BlocBuilder<AuthCubit, AuthStates>(
                        builder: (context, state) {
                          return CustomButton(
                            text: state is SignupLoading
                                ? "Loading ..."
                                : "Create Account",
                            onpressed: () {
                              state is SignupLoading
                                  ? null
                                  : context.read<AuthCubit>().signup(
                                      firstName: firstNameController.text
                                          .trim(),
                                      lastName: lastNameController.text.trim(),
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
                            text: "Already have an account?",
                            size: 13,
                            color: AppColors.secondry,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ),
                              );
                            },
                            child: CustomText(text: "Sign In", size: 14),
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
