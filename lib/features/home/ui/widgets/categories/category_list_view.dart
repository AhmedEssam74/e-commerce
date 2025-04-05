import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/utils/categories_images.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: FractionallySizedBox(
        widthFactor: 1.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categoriesImages.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
              },
              child: _buildCategoryItem(index: index, isSelected: index == 0)),
        ),
      ),
    );
  }

  Container _buildCategoryItem({
    required int index,
    required bool isSelected,
  }) {
    return Container(
      width: 65,
      height: 65,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.mainGreen : ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SvgPicture.asset(
          categoriesImages[index],
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : ColorsManager.mainGreen,
            BlendMode.srcIn,
          ),
          width: 36,
        ),
      ),
    );
  }
}
