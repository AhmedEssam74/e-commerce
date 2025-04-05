import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AllReviewsCard extends StatelessWidget {
  const AllReviewsCard({
    super.key,
    required this.reviewerName,
    required this.reviewText,
    required this.currentIndex,
  });
  final String reviewerName, reviewText;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.6),
        borderRadius: BorderRadius.circular(15),
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
                  color: ColorsManager.mainGreen,
                ),
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
          Row(
            children: List.generate(5, (index) {
              bool isSelected = currentIndex >= index + 1;
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: SvgPicture.asset(
                  isSelected ? Assets.svgsStarFill : Assets.svgsStarOutline,
                  width: isSelected ? 22 : 27,
                ),
              );
            }),
          ),
          verticalSpace(10),
          Text(
            reviewText,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: TextStyles.font14BlackRegular,
          ),
        ],
      ),
    );
  }
}
