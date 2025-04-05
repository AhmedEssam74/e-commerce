import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardingAppBar(
      {super.key,
      required this.isShowBackIcon,
      required this.onBack,
      required this.onSkip,
      required this.isSkip});
  final bool isShowBackIcon, isSkip;
  final VoidCallback onBack, onSkip;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: isShowBackIcon
          ? GestureDetector(
              onTap: onBack,
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: Colors.black,
              ),
            )
          : null,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 10.w),
          child: TextButton(
              onPressed: onSkip,
              child: Text(
                isSkip ? 'SKIP' : 'CONTINUE',
                style: TextStyles.font14MainGreenSemiBold,
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
