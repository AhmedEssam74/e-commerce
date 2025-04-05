import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../helpers/spacing.dart';
import '../theming/styles.dart';

class FullSheetAppBar extends StatelessWidget {
  const FullSheetAppBar(
      {super.key,
      this.title = 'Filter your search',
      this.subTitle = 'Select all filters you prefer for your search'});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 4,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.font18BlackSemiBold,
                ),
                verticalSpace(5),
                Text(
                  subTitle,
                  style: TextStyles.font12GreyRegular,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedCancelCircleHalfDot,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
        verticalSpace(10),
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}
