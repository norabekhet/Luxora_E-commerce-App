import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Auth/cubit/auth_cubit.dart';
import 'package:luxora_app/features/Auth/cubit/auth_states.dart';
import 'package:luxora_app/features/Auth/view/login_screen.dart';
import 'package:luxora_app/features/Auth/widget/custom_button.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> otpControllers = List.generate(6, (_) {
    return TextEditingController();
  });
  final List<FocusNode> focusNodes = List.generate(6, (_) {
    return FocusNode();
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is VerifySuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            } else if (state is VerifyFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  elevation: 5,
                  backgroundColor: Colors.red.shade900,
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
                text: "MAISON DE HAUTE JOAILLERIE",
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/email.png"),
                      Gap(16),
                      CustomText(text: "Verify Your Email", size: 24),
                      Gap(6),
                      CustomText(
                        text: "Enter the verification code sent to your",
                        color: AppColors.secondry,
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                      CustomText(
                        text: "registered address.",
                        color: AppColors.secondry,
                        weight: FontWeight.w400,
                        size: 14,
                      ),
                      Gap(10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.scaffoldBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: CustomText(
                            text: "name@domain.com",
                            size: 16,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 44,
                            height: 54,
                            child: TextField(
                              controller: otpControllers[index],
                              focusNode: focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                counterText: '',
                                filled: true,
                                fillColor: AppColors.scaffoldBackground,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.brown,
                                    width: 2,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  focusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  focusNodes[index - 1].requestFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      Gap(24),
                      BlocBuilder<AuthCubit, AuthStates>(
                        builder: (context, state) {
                          return CustomButton(
                            text: state is VerifyLoading
                                ? "Loading ... "
                                : "VERIFY EMAIL",
                            onpressed: () {
                              state is VerifyLoading
                                  ? null
                                  : context.read<AuthCubit>().verifyEmail(
                                      email: widget.email,
                                      otp: otpControllers
                                          .map((controller) => controller.text)
                                          .join(),
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
                            text: "Didn't receive the code?",
                            size: 13,
                            color: AppColors.secondry,
                          ),
                          Gap(4),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(text: "Resend Code", size: 14),
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
