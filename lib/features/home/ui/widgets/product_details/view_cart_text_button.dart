import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ViewCartTextButton extends StatelessWidget {
  const ViewCartTextButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorsManager.mainGreen,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.transparent, width: 0.8),
              borderRadius: BorderRadius.circular(35)),
          minimumSize: const Size(double.infinity, 56),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0x18000000),
              child: Text(
                '2',
                style: TextStyles.font16WhiteSemiBold,
              ),
            ),
            horizontalSpace(10),
            Text(
              'View cart',
              style: TextStyles.font16WhiteSemiBold,
            ),
            const Spacer(),
            Text(
              '\$400.00',
              style: TextStyles.font18WhiteBold,
            ),
          ],
        ));
  }
}
