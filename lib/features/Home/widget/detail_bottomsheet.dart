import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Home/data/product_model.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class DetailBottomsheet extends StatelessWidget {
  const DetailBottomsheet({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(color: AppColors.scaffoldBackground),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Total :", size: 14.sp),
              CustomText(text: "${productModel.price}\$", size: 16.sp),
            ],
          ),
          Spacer(),
          SizedBox(
            height: 45.h,
            width: 200.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15.r),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.primary,
                    behavior: SnackBarBehavior.floating,
                    content: Text("Producr Added to Cart Successfuly"),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.card_travel, color: Colors.white, size: 18.r),
                  Gap(6.w),
                  CustomText(
                    text: "Add To Bag",
                    size: 18.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
