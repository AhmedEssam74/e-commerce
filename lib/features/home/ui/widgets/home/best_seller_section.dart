import 'package:ecommerce/features/home/ui/widgets/home/product_card.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Seller',
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
                imageUrl: Assets.imagesBestSellerImage,
                isFavourite: false,
                category: 'Beds- Bed rooms',
                name: 'Modern bed',
                price: '230.00',
                rateCount: '4.0',
              ),
            ),
          ),
        ),
       
      ],
    );
  }
}
