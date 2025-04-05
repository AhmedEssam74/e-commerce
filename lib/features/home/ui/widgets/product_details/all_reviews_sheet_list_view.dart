import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/home/ui/widgets/product_details/all_reviews_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theming/styles.dart';

class AllReviewsSheetListView extends StatelessWidget {
  const AllReviewsSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          verticalSpace(10),
          Row(
            children: [
              SvgPicture.asset(
                Assets.svgsStarFill,
                width: 20,
              ),
              horizontalSpace(8),
              Text(
                '4.2 (30 reviews)',
                style: TextStyles.font14BlackRegular.copyWith(
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
          verticalSpace(20),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const AllReviewsCard(
                reviewerName: 'Jannis Schmitt',
                reviewText:
                    '“ Lorem ipsum dolor sit amet consectetur. Semper elementum sit egestas nulla semper. Venenatis tortor hendrerit.”',
                currentIndex: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
