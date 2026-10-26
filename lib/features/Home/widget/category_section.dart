import 'package:flutter/material.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key, required this.category});
  final List category;

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 1,
                    offset: Offset(-1, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: selected != index
                    ? Color(0xffF4F4F2)
                    : AppColors.primary,
              ),
              child: CustomText(
                text: widget.category[index],
                color: selected != index ? Colors.black54 : Colors.white,
                size: 16,
              ),
            ),
          );
        }),
      ),
    );
  }
}
