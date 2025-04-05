import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_images.dart';

class OrderRatingSection extends StatefulWidget {
  const OrderRatingSection({super.key});

  @override
  State<OrderRatingSection> createState() => _OrderRatingSectionState();
}

class _OrderRatingSectionState extends State<OrderRatingSection> {
  int currentIndex = -1;
  void onRate(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      if (currentIndex == index) {
        currentIndex = index - 1;
      } else {
        currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rate your experience',
              style: TextStyles.font12GreySemiBold,
            ),
            Row(
              children: List.generate(5, (index) {
                bool isSelected = currentIndex >= index;
                return GestureDetector(
                  onTap: () {
                    onRate(index);
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: SvgPicture.asset(
                      isSelected ? Assets.svgsStarFill : Assets.svgsStarOutline,
                      width: 22,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        verticalSpace(5),
      ],
    );
  }
}
