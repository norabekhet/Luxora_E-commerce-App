import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Auth/cubit/auth_cubit.dart';
import 'package:luxora_app/features/Auth/view/signup_screen.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/cateegory_cubit.dart';
import 'package:luxora_app/features/Home/cubit/offers_cubit/offers_cubit.dart';
import 'package:luxora_app/features/Home/cubit/product_cubit/product_cubit.dart';

void main() {
  runApp(const LuxoraApp());
}

class LuxoraApp extends StatelessWidget {
  const LuxoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProductCubit()..getProducts()),
        BlocProvider(create: (context) => OffersCubit()..getOffers()),
        BlocProvider(create: (context) => CateegoryCubit()..getCategory()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldBackground),
        home: SignupScreen(),
      ),
    );
  }
}
