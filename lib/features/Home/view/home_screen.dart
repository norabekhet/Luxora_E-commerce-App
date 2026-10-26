import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxora_app/core/constant/app_colors.dart';
import 'package:luxora_app/features/Home/widget/category_section.dart';
import 'package:luxora_app/features/Home/widget/custom_appBar.dart';
import 'package:luxora_app/features/Home/widget/offers_section.dart';
import 'package:luxora_app/features/Home/widget/product_section.dart';
import 'package:luxora_app/shared%20widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> offers = [
    {
      "name": "Electronics Offer 1",
      "description": "a limited time offer on electronics category",
    },
    {
      "name": "Electronics Offer 2",
      "description": "a limited time offer on electronics category",
    },
    {
      "name": "Electronics Offer 3",
      "description": "a limited time offer on electronics category",
    },
  ];
  final List<String> category = [
    "All",
    "clothing",
    'bags',
    "shoes",
    'clothing',
    'bags',
    "shoes",
    'clothing',
  ];
  final List<Map<String, dynamic>> products = [
    {
      "name": "Genuine Leather Jacket",
      "description":
          "Premium genuine leather jacket with a modern design, soft inner lining, durable craftsmanship, and a comfortable fit. Perfect for casual outings and cold weather.",
      "coverPictureUrl":
          "https://media.istockphoto.com/id/1359676849/photo/hanging-leather-jacket-interior.webp?a=1&b=1&s=612x612&w=0&k=20&c=OqhcmN7RxHDDWJ-RrNHIzEvJfXwRsJ8POZwUvIrF-BA=",
      "price": 2499.00,
    },
    {
      "name": "Genuine Leather Jacket",
      "description":
          "Premium genuine leather jacket with a modern design, soft inner lining, durable craftsmanship, and a comfortable fit. Perfect for casual outings and cold weather.",
      "coverPictureUrl":
          "https://media.istockphoto.com/id/1359676849/photo/hanging-leather-jacket-interior.webp?a=1&b=1&s=612x612&w=0&k=20&c=OqhcmN7RxHDDWJ-RrNHIzEvJfXwRsJ8POZwUvIrF-BA=",
      "price": 2499.00,
    },
    {
      "name": "Genuine Leather Jacket",
      "description":
          "Premium genuine leather jacket with a modern design, soft inner lining, durable craftsmanship, and a comfortable fit. Perfect for casual outings and cold weather.",
      "coverPictureUrl":
          "https://media.istockphoto.com/id/1359676849/photo/hanging-leather-jacket-interior.webp?a=1&b=1&s=612x612&w=0&k=20&c=OqhcmN7RxHDDWJ-RrNHIzEvJfXwRsJ8POZwUvIrF-BA=",

      "price": 2499.00,
    },
    {
      "name": "Genuine Leather Jacket",
      "description":
          "Premium genuine leather jacket with a modern design, soft inner lining, durable craftsmanship, and a comfortable fit. Perfect for casual outings and cold weather.",
      "coverPictureUrl":
          "https://media.istockphoto.com/id/1359676849/photo/hanging-leather-jacket-interior.webp?a=1&b=1&s=612x612&w=0&k=20&c=OqhcmN7RxHDDWJ-RrNHIzEvJfXwRsJ8POZwUvIrF-BA=",
      "price": 2499.00,
    },
    {
      "name": "Genuine Leather Jacket",
      "description":
          "Premium genuine leather jacket with a modern design, soft inner lining, durable craftsmanship, and a comfortable fit. Perfect for casual outings and cold weather.",
      "coverPictureUrl":
          "https://media.istockphoto.com/id/1359676849/photo/hanging-leather-jacket-interior.webp?a=1&b=1&s=612x612&w=0&k=20&c=OqhcmN7RxHDDWJ-RrNHIzEvJfXwRsJ8POZwUvIrF-BA=",
      "price": 2499.00,
    },
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Luxora'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //offers
              Row(
                children: [
                  CustomText(text: "Exclusive Offers", size: 20),
                  Spacer(),
                  CustomText(text: "View All", size: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
              OffersSection(offers: offers, currentPage: currentPage),
              Gap(24),
              //category
              Row(
                children: [
                  CustomText(text: "Shop by Category", size: 20),
                  Spacer(),
                  CustomText(text: "View All", size: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
              Gap(8),
              CategorySection(category: category),
              Gap(24),
              //products
              Row(
                children: [
                  CustomText(text: "Featured Products", size: 20),
                  Spacer(),
                  CustomText(text: "View All", size: 14),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
              ProductSection(products: products),
            ],
          ),
        ),
      ),
    );
  }
}
