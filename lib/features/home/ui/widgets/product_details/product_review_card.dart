import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/styles.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard(
      {super.key, required this.reviewerName, required this.reviewText});
  final String reviewerName, reviewText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsetsDirectional.only(end: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: ColorsManager.lightGreen,
                child: HugeIcon(
                    icon: HugeIcons.strokeRoundedUser,
                    color: ColorsManager.mainGreen),
              ),
              horizontalSpace(10),
              Expanded(
                  child: Text(
                reviewerName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ))
            ],
          ),
          verticalSpace(10),
          Expanded(
            child: Text(
              reviewText,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyles.font14BlackRegular,
            ),
          ),
        ],
      ),
    );
  }
}
