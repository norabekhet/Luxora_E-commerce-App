import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/core/routing/routes.dart';
import 'package:luxora_app/features/Auth/cubit/auth_cubit.dart';
import 'package:luxora_app/features/Auth/view/login_screen.dart';
import 'package:luxora_app/features/Auth/view/signup_screen.dart';
import 'package:luxora_app/features/Auth/view/verify_email_screen.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/cateegory_cubit.dart';
import 'package:luxora_app/features/Home/cubit/offers_cubit/offers_cubit.dart';
import 'package:luxora_app/features/Home/cubit/product_cubit/product_cubit.dart';
import 'package:luxora_app/features/Home/data/product_model.dart';
import 'package:luxora_app/features/Home/view/category_screen.dart';
import 'package:luxora_app/features/Home/view/details_screen.dart';
import 'package:luxora_app/features/Home/view/home_screen.dart';
import 'package:luxora_app/splash.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: SignupScreen(),
          ),
        );
      case Routes.verifyEmailScreen:
        String name = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: VerifyEmailScreen(email: name),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ProductCubit()..getProducts()),
              BlocProvider(create: (context) => OffersCubit()..getOffers()),
              BlocProvider(
                create: (context) => CateegoryCubit()..getCategory(),
              ),
            ],
            child: HomeScreen(),
          ),
        );
      case Routes.detailsScreen:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(productModel: product),
        );
      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CateegoryCubit()..getCategory(),
            child: CategoryScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
