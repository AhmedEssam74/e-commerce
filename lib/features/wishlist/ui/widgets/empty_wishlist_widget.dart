import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/styles.dart';

class EmptyWishlistWidget extends StatelessWidget {
  const EmptyWishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsEmptyWishlistImage),
        verticalSpace(20),
        Text(
          'Your Wishlist is Empty',
          style: TextStyles.font18lackBold,
        ),
        verticalSpace(10),
        Text(
          'Find something you love? Tap the heart icon on any product to add it to your wishlist for later!',
         textAlign: TextAlign.center,
          style: TextStyles.font14BlackRegular.copyWith(color: const Color(0x68000000)),
        )
      ],
    );
  }
}
