import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/core/routing/routes.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({super.key, required this.products});
  final List products;

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .75,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailsScreen,
              arguments: product,
            );
          },
          child: Card(
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
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120.h,
                    ),
                  ),
                  Gap(6.h),
                  CustomText(
                    weight: FontWeight.w600,
                    size: 14.sp,
                    text: product.name,
                    maxLines: 1,
                  ),
                  CustomText(
                    weight: FontWeight.w400,
                    size: 12.sp,
                    text: product.description,
                    maxLines: 1,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomText(text: '${product.price}\$', size: 12.sp),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: AppColors.primary,
                          size: 20.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
