import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theming/styles.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsEmptyCartImage),
        verticalSpace(20),
        Text(
          'Your cart is empty',
          style: TextStyles.font18lackBold,
        ),
        verticalSpace(10),
        Text(
          'Looks like you haven\'t added anything to your cart yet.  Browse our beautiful selection of furniture and décor to find items you love!',
          textAlign: TextAlign.center,
          style: TextStyles.font14BlackRegular
              .copyWith(color: const Color(0x68000000)),
        )
      ],
    );
  }
}
