import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class NoSavedAddressesWidget extends StatelessWidget {
  const NoSavedAddressesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HugeIcon(
            icon: HugeIcons.strokeRoundedLocationOffline01,
            color: ColorsManager.mainGreen,
            size: 150,
          ),
          verticalSpace(20),
          Text(
            'No addresses available',
            style: TextStyles.font18lackBold,
          ),
          verticalSpace(10),
          Text(
            'It looks like you haven\'t added any addresses yet. Add a new address to proceed with your order.',
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
