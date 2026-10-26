import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.network(
                  widget.productModel.image,
                  fit: BoxFit.cover,
                  height: 350,
                  width: double.infinity,
                ),
              ),
              Gap(16),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (context) {
                      return Image.asset(
                        "assets/stars.png",
                        fit: BoxFit.cover,
                        height: 15,
                        width: 15,
                      );
                    }),
                  ),
                  Gap(6),
                  CustomText(
                    text:
                        "${widget.productModel.rating} (${widget.productModel.reviewsCount} Atelier Reviews)",
                    size: 14,
                  ),
                ],
              ),
              Gap(16),
              CustomText(text: widget.productModel.name, color: Colors.black),
              Gap(6),
              Row(
                children: [
                  CustomText(text: "${widget.productModel.price}\$"),
                  Gap(6),
                  CustomText(text: "USD • Duties & Taxes Included", size: 14),
                ],
              ),
              Gap(12),
              CustomText(
                text: widget.productModel.description,
                size: 16,
                color: Colors.black54,
              ),
              Gap(10),
              ColorCard(),
              Gap(16),
              SizeCard(),
              Gap(100),
            ],
          ),
        ),
      ),
      bottomSheet: DetailBottomsheet(productModel: widget.productModel),
    );
  }
}
