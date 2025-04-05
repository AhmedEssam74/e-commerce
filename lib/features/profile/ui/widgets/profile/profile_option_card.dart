import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class ProfileOptionCard extends StatelessWidget {
  const ProfileOptionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.trailing,
    this.isShowDivider = true,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isShowDivider;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Row(
            children: [
              CircleAvatar(
                  radius: 22,
                  backgroundColor: ColorsManager.lightGreen,
                  child: HugeIcon(
                    icon: icon,
                    color: ColorsManager.mainGreen,
                  )),
              horizontalSpace(10),
              Text(
                title,
                style: TextStyles.font14BlackSemiBold,
              ),
              const Spacer(),
              trailing ??
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    color: ColorsManager.grey,
                    size: 28,
                  )
            ],
          ),
        ),
        if (isShowDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Divider(
              thickness: 0.5,
            ),
          )
      ],
    );
  }
}
