import 'package:ecommerce/features/home/ui/widgets/home/product_card.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured products',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(10),
        SizedBox(
          height: 300,
          child: FractionallySizedBox(
            widthFactor: 1.1,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const ProductCard(
                imageUrl: Assets.imagesTable,
                isFavourite: false,
                category: 'Tables',
                name: 'Modern tables',
                price: '230.00',
                rateCount: '3.0',
              ),
            ),
          ),
        ),
        verticalSpace(50),
      ],
    );
  }
}
