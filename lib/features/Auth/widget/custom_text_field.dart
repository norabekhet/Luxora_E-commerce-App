import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hint,
    this.controller,
    required this.label,
    this.isPassword = false,
  });
  final IconData? prefixIcon;
  final String hint;
  final TextEditingController? controller;
  final String label;
  final bool? isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: widget.label, size: 14.sp),
        TextFormField(
          controller: widget.controller,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: AppColors.primary,
          cursorHeight: 14.h,
          obscureText: widget.isPassword == true && isObscure,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: 18.sp,
                    color: AppColors.secondry,
                  )
                : null,
            suffixIcon: widget.isPassword == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure
                        ? Icon(
                            Icons.visibility,
                            size: 18.r,
                            color: AppColors.secondry,
                          )
                        : Icon(
                            Icons.visibility_off,
                            size: 18.r,
                            color: AppColors.secondry,
                          ),
                  )
                : null,
            hint: CustomText(
              text: widget.hint,
              color: AppColors.secondry,
              size: 14.sp,
              weight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.only(left: 10.w),
            fillColor: AppColors.textField,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
