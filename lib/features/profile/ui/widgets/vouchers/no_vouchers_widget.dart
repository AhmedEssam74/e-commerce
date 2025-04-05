import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class NoVouchersWidget extends StatelessWidget {
  const NoVouchersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.svgsNoVouchersImage,
            width: 250,
          ),
          verticalSpace(20),
          Text(
            'No vouchers available',
            style: TextStyles.font18lackBold,
          ),
          verticalSpace(10),
          Text(
            'It looks like you don\'t have any vouchers yet. Explore our offers and redeem exciting deals to collect vouchers!',
            textAlign: TextAlign.center,
            style: TextStyles.font14BlackRegular
                .copyWith(color: const Color(0x68000000)),
          ),
          verticalSpace(60),
        ],
      ),
    );
  }
}
