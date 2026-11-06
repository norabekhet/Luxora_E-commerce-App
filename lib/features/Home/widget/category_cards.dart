import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class CategoryCards extends StatefulWidget {
  const CategoryCards({super.key, required this.category});
  final List category;

  @override
  State<CategoryCards> createState() => _CategoryCardsState();
}

class _CategoryCardsState extends State<CategoryCards> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .72,
      ),
      itemCount: widget.category.length,
      itemBuilder: (context, index) {
        final category = widget.category[index];
        return Card(
          shadowColor: Colors.black,
          elevation: 1.5,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                  child: Image.network(
                    category.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 120.h,
                  ),
                ),
                Gap(6),
                CustomText(
                  weight: FontWeight.w600,
                  size: 20.sp,
                  text: category.name,
                  maxLines: 1,
                ),
                CustomText(
                  weight: FontWeight.w400,
                  size: 14.sp,
                  text: category.description,
                  maxLines: 1,
                ),
                Spacer(),
                Row(
                  children: [
                    CustomText(
                      text: 'HAND-STITCHED',
                      size: 10.sp,
                      color: AppColors.secondry,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.star_fill,
                        color: AppColors.primary,
                        size: 14.r,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
