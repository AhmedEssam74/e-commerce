import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/colors.dart';

class SavedAddressCard extends StatelessWidget {
  const SavedAddressCard({
    super.key,
    required this.address,
    required this.description,
    required this.onTap,
  });
  final String address, description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          children: [
            const CircleAvatar(
                radius: 22,
                backgroundColor: ColorsManager.lightGreen,
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedLocation01,
                  color: ColorsManager.mainGreen,
                )),
            horizontalSpace(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: TextStyles.font14BlackSemiBold,
                  ),
                  verticalSpace(6),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font12GreyRegular,
                  ),
                ],
              ),
            ),
            horizontalSpace(15),
            GestureDetector(
              onTap: () {},
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: ColorsManager.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
