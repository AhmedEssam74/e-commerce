import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/utils/categories_images.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shop by categories',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoriesImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.1),
          itemBuilder: (context, index) {
            return _buildCategoryCard(index, context);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(int index, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.pushNamed(Routes.categoriesScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color:  ColorsManager.lightGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: SvgPicture.asset(
          categoriesImages[index],
          width: 36,
        )),
      ),
    );
  }
}
