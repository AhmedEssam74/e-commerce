import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theming/colors.dart';

class ProductWeightAndDimensions extends StatelessWidget {
  const ProductWeightAndDimensions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weight & dimensions',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(10),
        Row(
          children: List.generate(
              3,
              (index) => Container(
                    margin: const EdgeInsetsDirectional.only(end: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Width',
                          style: TextStyles.font14MainGreenSemiBold,
                        ),
                        verticalSpace(2),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '50',
                              style: TextStyles.font14MainGreenSemiBold,
                            ),
                            horizontalSpace(2),
                            Text(
                              '(cm)',
                              style: TextStyles.font14MainGreenSemiBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}
