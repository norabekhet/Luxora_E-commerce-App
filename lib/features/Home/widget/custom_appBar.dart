import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, this.isLeading = false, required this.title});
  final bool? isLeading;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.scaffoldBackground,
      title: CustomText(text: title),
      leading: isLeading == true
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.arrow_left, color: AppColors.primary),
            )
          : null,
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.search, color: AppColors.primary),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.bag, color: AppColors.primary),
            ),
          ],
        ),
      ],
    );
  }
}
