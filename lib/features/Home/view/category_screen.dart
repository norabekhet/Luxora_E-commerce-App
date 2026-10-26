import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/cateegory_cubit.dart';
import 'package:luxora_app/features/Home/cubit/category_cubit/category_states.dart';
import 'package:luxora_app/features/Home/widget/category_cards.dart';
import 'package:luxora_app/features/Home/widget/custom_appBar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Luxora"),
      body: SafeArea(
        child: BlocBuilder<CateegoryCubit, CategoryStates>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CupertinoActivityIndicator());
            } else if (state is CategorySuccess) {
              return CategoryCards(
                category: context.read<CateegoryCubit>().category,
              );
            } else if (state is CategoryFailure) {
              return Center(child: Text(state.message));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
