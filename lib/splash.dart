import 'package:flutter/material.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/core/routing/routes.dart';
import 'package:luxora_app/core/utils/pref_helper.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _goNextScreen();
  }

  Future<void> _goNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    final isLoggedIn = await PrefHelper.isLoggedIn();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? Routes.homeScreen : Routes.loginScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: "LUXORA.", size: 30, color: AppColors.primary),
      ),
    );
  }
}
