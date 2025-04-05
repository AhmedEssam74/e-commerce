import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';

class OtpImageAndText extends StatelessWidget {
  const OtpImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        Image.asset(
          Assets.imagesOtpImage,
          width: 200,
        ),
        verticalSpace(35),
        Text(
          'Verify phone number',
          style: TextStyles.font18lackBold,
        ),
        verticalSpace(5),
        Text(
          'Please enter 6-digits code sent to\n+49 1573 8937699',
          textAlign: TextAlign.center,
          style: TextStyles.font14BlackRegular.copyWith(height: 1.8),
        ),
        verticalSpace(35),
      ],
    );
  }
}
