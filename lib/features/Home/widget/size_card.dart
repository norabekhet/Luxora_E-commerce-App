import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class SizeCard extends StatefulWidget {
  const SizeCard({super.key});

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  final List<String> size = ["XS", "S", "M", "L"];
  int? selectedSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: "Selected Size",
                  color: Colors.black,
                  size: 18.sp,
                ),
                Spacer(),
                CustomText(text: "Atelier Sizing Guide", size: 14.sp),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 29.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: selectedSize == index
                          ? AppColors.primary
                          : AppColors.scaffoldBackground,
                    ),
                    child: CustomText(
                      text: size[index],
                      size: 14.sp,
                      color: selectedSize == index
                          ? Colors.white
                          : AppColors.primary,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
