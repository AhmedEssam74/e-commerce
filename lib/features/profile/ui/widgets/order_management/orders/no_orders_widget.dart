import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/theming/styles.dart';

class NoOrdersWidget extends StatelessWidget {
  const NoOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsNoOrdersImage),
        verticalSpace(20),
        Text(
          'No Orders Yet',
          style: TextStyles.font18lackBold,
        ),
        verticalSpace(10),
        Text(
          'Looks like you haven\'t placed any orders yet. Start shopping now and enjoy our exclusive deals!',
          textAlign: TextAlign.center,
          style: TextStyles.font14BlackRegular.copyWith(
            color: const Color(0x68000000),
          ),
        ),
        verticalSpace(60),
      ],
    );
  }
}
