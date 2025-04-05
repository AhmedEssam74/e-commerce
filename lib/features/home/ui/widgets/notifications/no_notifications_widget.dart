import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theming/styles.dart';

class NoNotificationsWidget extends StatelessWidget {
  const NoNotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsNoNotificationsImage,width: 250,),
        verticalSpace(20),
        Text(
          'No Notifications Yet', 
          style: TextStyles.font18lackBold,
        ),
        verticalSpace(10),
        Text(
          'Stay tuned! We\'ll notify you about new products, promotions, and updates.', // More relevant message
          textAlign: TextAlign.center,
          style: TextStyles.font14BlackRegular
              .copyWith(color: const Color(0x68000000)),
        ),
      ],
    );
  }
}
