import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.lightGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedLocation06,
                color: ColorsManager.mainGreen,
              ),
              horizontalSpace(10),
              Text(
                'Delivering to',
                style: TextStyles.font14MainGreenSemiBold,
              ),
              const Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      'Change',
                      style: TextStyles.font14BlackSemiBold,
                    ),
                  ),
                  horizontalSpace(5),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowDown01,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(10),
          Text(
            '23rd Abbas Elakkad street, Nasr City,Cairo, Egypt',
            style: TextStyles.font12MainGreenRegular,
          ),
        ],
      ),
    );
  }
}
