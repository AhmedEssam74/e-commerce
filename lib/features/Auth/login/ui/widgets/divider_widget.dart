import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
           Expanded(
            child:  Divider(
              color: ColorsManager.grey,
              thickness: .5.w,
              indent: 10,
              endIndent: 11,
            ),
          ),
          Text(
            "Or login with",
            style: TextStyles.font11GreyMedium,
          ),
            Expanded(
             child: Divider(
              color: ColorsManager.grey,
              thickness: .5.w,
              indent: 11,
              endIndent: 10,
                       ),
           ),
        ],
      ),
    );
  }
}
