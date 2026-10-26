import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/features/Home/widget/color_card.dart';
import 'package:luxora_app/features/Home/widget/custom_appBar.dart';
import 'package:luxora_app/features/Home/widget/detail_bottomsheet.dart';
import 'package:luxora_app/features/Home/widget/size_card.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

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
                child: Image.asset(
                  "assets/Container.png",
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
                  CustomText(text: "4.9 (48 Atelier Reviews)", size: 14),
                ],
              ),
              Gap(16),
              CustomText(
                text: "The Sartorial Double-Breasted Wool Trench",
                color: Colors.black,
              ),
              Gap(6),
              Row(
                children: [
                  CustomText(text: "\$1,280"),
                  Gap(6),
                  CustomText(text: "USD • Duties & Taxes Included", size: 14),
                ],
              ),
              Gap(12),
              CustomText(
                text:
                    "Tailored from Italian virgin wool with a relaxed silhouette and structured shoulder line. Lined in lightweight silk crepe de chine for effortless seasonal layering across bespoke evening and daywear.",
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
      bottomSheet: DetailBottomsheet(),
    );
  }
}
