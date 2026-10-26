import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Home/view/details_screen.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key, required this.products});
  final List products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .82,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                },
              ),
            );
          },
          child: Card(
            shadowColor: Colors.black,
            elevation: 1.5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    products[index]['coverPictureUrl'],
                    fit: BoxFit.cover,
                  ),
                  CustomText(
                    weight: FontWeight.w600,
                    size: 16,
                    text: products[index]["name"],
                    maxLines: 1,
                  ),
                  CustomText(
                    weight: FontWeight.w400,
                    size: 14,
                    text: products[index]["description"],
                    maxLines: 1,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomText(text: '${products[index]["price"]}', size: 14),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: AppColors.primary,
                          size: 20,
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
