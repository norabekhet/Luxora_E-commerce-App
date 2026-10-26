import 'package:flutter/material.dart';
import 'package:luxora_app/core/constant/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
    this.maxLines,
  });
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines != null ? 1 : null,
      overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.fade,
      style: TextStyle(
        fontSize: size ?? 24,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? AppColors.primary,
      ),
    );
  }
}
