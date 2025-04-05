import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/home/ui/widgets/home/categories_section.dart';
import 'package:ecommerce/features/home/ui/widgets/home/featured_products_section.dart';
import 'package:flutter/material.dart';
import '../widgets/home/best_seller_section.dart';
import '../widgets/home/home_appbar.dart';
import '../widgets/home/banner_slider.dart';
import '../widgets/home/new_arrival_section.dart';
import '../widgets/home/rooms_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              const BannerSlider(),
              verticalSpace(20),
             const CategoriesSection(),
              verticalSpace(20),
              const NewArrivalsSection(),
              verticalSpace(15),
              const RoomsSection(),
              verticalSpace(20),
              const BestSellerSection(),
              verticalSpace(20),
              const FeaturedProductsSection(),
            ],
          ),
        ),
      )),
    );
  }
}
