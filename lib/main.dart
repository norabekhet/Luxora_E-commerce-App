import 'package:flutter/material.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/core/routing/app_router.dart';
import 'package:luxora_app/splash.dart';

void main() {
  runApp(const LuxoraApp());
}

class LuxoraApp extends StatelessWidget {
  const LuxoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldBackground),
      home: Splash(),
    );
  }
}
