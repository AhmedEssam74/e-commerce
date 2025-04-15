import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/features/home/data/utils/categories_images.dart';
import 'package:ecommerce/features/search/ui/widgets/search/search_categroy_card.dart';
import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: TextStyles.font16BlackBold),
          verticalSpace(15),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: categoriesImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 160),
              itemBuilder: (context, index) {
                return SearchCategroyCard(
                  image: categoriesImages[index],
                  title: 'Sofas & Couches',
                  description:
                      'Shop latest and modern design for featured & special sofas couches',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
