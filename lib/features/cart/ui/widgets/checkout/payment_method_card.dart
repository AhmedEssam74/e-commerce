import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });
  final String paymentMethod, image;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? ColorsManager.mainGreen : Colors.grey,
          width: 0.8,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
            horizontalSpace(10),
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                paymentMethod,
                style: TextStyles.font14BlackRegular,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(3),
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.mainGreen,
                  )),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? ColorsManager.mainGreen : Colors.transparent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
