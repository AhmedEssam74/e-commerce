import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleOrAppleBtn extends StatelessWidget {
  final String lableText;


  final String iconAsset;
  final VoidCallback onTap;

  const GoogleOrAppleBtn(
      {super.key,
      required this.iconAsset,
      required this.lableText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return Expanded(
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 10,
        padding: EdgeInsets.all(10.r),
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: SvgPicture.asset(
            iconAsset,
            height: 20.h,
            width: 20.w,
          ),
          label: Text(
            lableText,
            style: TextStyles.font14BlackMedium,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            side: BorderSide(color: ColorsManager.grey, width: .5.w),
          ),
        ),
      ),
    );
  }
}
