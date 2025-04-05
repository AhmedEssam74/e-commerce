import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ProductStockStatusCard extends StatelessWidget {
  const ProductStockStatusCard({super.key, required this.isAvailable});
  final bool isAvailable;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isAvailable ? ColorsManager.lightGreen : const Color(0x20EB4335),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(
            icon: isAvailable
                ? HugeIcons.strokeRoundedAlert01
                : HugeIcons.strokeRoundedUnavailable,
            color:
                isAvailable ? ColorsManager.mainGreen : const Color(0xffEB4335),
          ),
          horizontalSpace(10),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              isAvailable ? 'Only 5 left in stock' : 'Out of stock!',
              style: TextStyles.font12MainGreenSemiBold.copyWith(
                decoration: TextDecoration.none,
                color: isAvailable
                    ? ColorsManager.mainGreen
                    : const Color(0xffEB4335),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
