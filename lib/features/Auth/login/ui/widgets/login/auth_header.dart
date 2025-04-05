import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader(
      {super.key,
      this.title = 'Go ahead and setup your\naccount',
      this.subTitle =
          'Login or sign up to enjoy the best experience with Heim'});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          Text(
            title,
            style: TextStyles.font20WhiteBold,
          ),
          verticalSpace(3),
          const Divider(
            thickness: 0.5,
          ),
          verticalSpace(3),
          Text(
            subTitle,
            style: TextStyles.font11WhiteRegular,
          ),
          verticalSpace(25),
        ],
      ),
    );
  }
}
