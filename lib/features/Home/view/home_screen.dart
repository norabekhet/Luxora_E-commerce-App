import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/cateegory_cubit.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/category_states.dart';
import 'package:luxora_app/features/Home/cubit/offers_cubit/offers_cubit.dart';
import 'package:luxora_app/features/Home/cubit/offers_cubit/offers_states.dart';
import 'package:luxora_app/features/Home/cubit/product_cubit/product_cubit.dart';
import 'package:luxora_app/features/Home/cubit/product_cubit/product_states.dart';
import 'package:luxora_app/features/Home/widget/category_section.dart';
import 'package:luxora_app/features/Home/widget/custom_appBar.dart';
import 'package:luxora_app/features/Home/widget/offers_section.dart';
import 'package:luxora_app/features/Home/widget/product_section.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Luxora'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //offers
              Row(
                children: [
                  CustomText(text: "Exclusive Offers", size: 20),
                  Spacer(),
                  CustomText(text: "View All", size: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
              BlocBuilder<OffersCubit, OffersStates>(
                builder: (context, state) {
                  if (state is OffersLoading) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (state is OffersSuccess) {
                    return OffersSection(
                      offers: context.read<OffersCubit>().offers,
                      currentPage: currentPage,
                    );
                  } else if (state is OffersFailure) {
                    return Text(state.message);
                  }
                  return SizedBox();
                },
              ),
              Gap(24),
              //category
              Row(
                children: [
                  CustomText(text: "Shop by Category", size: 20),
                  Spacer(),
                  CustomText(text: "View All", size: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
              Gap(8),
              BlocBuilder<CateegoryCubit, CategoryStates>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (state is CategorySuccess) {
                    return CategorySection(
                      category: context.read<CateegoryCubit>().category,
                    );
                  } else if (state is CategoryFailure) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox();
                },
              ),
              Gap(24),
              //products
              Row(
                children: [
                  CustomText(text: "Featured Products", size: 20),
                  Spacer(),
                  CustomText(text: "View All", size: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
              BlocBuilder<ProductCubit, ProductStates>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (state is ProductSuccess) {
                    return ProductSection(
                      products: context.read<ProductCubit>().products,
                    );
                  } else if (state is ProductFailure) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
