import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/features/Home/data/product_model.dart';
import 'package:luxora_app/features/Home/widget/color_card.dart';
import 'package:luxora_app/features/Home/widget/custom_appBar.dart';
import 'package:luxora_app/features/Home/widget/detail_bottomsheet.dart';
import 'package:luxora_app/features/Home/widget/size_card.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Product Detail", isLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15.r),
                child: Image.network(
                  widget.productModel.image,
                  fit: BoxFit.cover,
                  height: 350.h,
                  width: double.infinity,
                ),
              ),
              Gap(16.h),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (context) {
                      return Image.asset(
                        "assets/stars.png",
                        fit: BoxFit.cover,
                        height: 15.h,
                        width: 15.w,
                      );
                    }),
                  ),
                  Gap(6.w),
                  CustomText(
                    text:
                        "${widget.productModel.rating} (${widget.productModel.reviewsCount} Atelier Reviews)",
                    size: 14.sp,
                  ),
                ],
              ),
              Gap(16.h),
              CustomText(
                text: widget.productModel.name,
                size: 22.sp,
                color: Colors.black,
              ),
              Gap(6.h),
              Row(
                children: [
                  CustomText(
                    text: "${widget.productModel.price}\$",
                    size: 20.sp,
                  ),
                  Gap(6.w),
                  CustomText(
                    text: "USD • Duties & Taxes Included",
                    size: 14.sp,
                  ),
                ],
              ),
              Gap(12.h),
              CustomText(
                text: widget.productModel.description,
                size: 16.sp,
                color: Colors.black54,
              ),
              Gap(10.h),
              ColorCard(),
              Gap(16.h),
              SizeCard(),
              Gap(100.h),
            ],
          ),
        ),
      ),
      bottomSheet: DetailBottomsheet(productModel: widget.productModel),
    );
  }
}
