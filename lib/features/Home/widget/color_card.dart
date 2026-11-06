import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({super.key});

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
                CustomText(text: "Color", color: Colors.black, size: 20.sp),
                Spacer(),
                CustomText(text: "Deep Olive", size: 18.sp),
              ],
            ),
            Image.asset("assets/colors.png"),
          ],
        ),
      ),
    );
  }
}
