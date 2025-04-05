import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';
import '../home/product_card.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        padding: const EdgeInsets.only(bottom: 25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          return const ProductCard(
            imageUrl: Assets.imagesTable,
            isFavourite: false,
            isPadding: false,
            category: 'Tables',
            name: 'Modern tables',
            price: '230.00',
            rateCount: '3.0',
          );
        },
      ),
    );
  }
}
