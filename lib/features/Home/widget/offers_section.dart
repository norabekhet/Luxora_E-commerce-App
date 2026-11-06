import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({
    super.key,
    required this.offers,
    required this.currentPage,
  });
  final List offers;
  final int currentPage;

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  int currentPage = 0;
  @override
  void initState() {
    currentPage = widget.currentPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 210.h,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemCount: widget.offers.length,
        itemBuilder: (context, index) {
          final offer = widget.offers[index];
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15.r),
                  child: Image.asset(
                    "assets/offers.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15.r),
                  child: Image.asset(
                    "assets/Gradient.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 20.w,
                  bottom: 20.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.h,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.scaffoldBackground,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: CustomText(
                            text: "ELEGANCE IN EVERY DETAIL",
                            size: 12.sp,
                          ),
                        ),
                      ),
                      CustomText(
                        text: offer.name,
                        size: 16.sp,
                        color: Colors.white,
                        maxLines: 1,
                      ),
                      CustomText(
                        text: offer.description,
                        size: 14.sp,
                        color: Colors.white,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
