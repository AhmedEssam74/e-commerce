import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final String? hintText;

  const PhoneNumberWidget({
    super.key,
    this.hintText,
    required this.phoneNumberController,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        prefixIcon: const HugeIcon(
          icon: HugeIcons.strokeRoundedSmartPhone01,
          color: ColorsManager.mainGreen,
        ),
        counterText: "",
        hintText: hintText,
        hintStyle: TextStyles.font13GreyMedium,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: BorderSide(color: ColorsManager.mainGreen, width: 0.6.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: BorderSide(color: Colors.grey, width: 0.6.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: BorderSide(color: Colors.red, width: 0.6.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: BorderSide(color: Colors.red, width: 0.6.w),
        ),
      ),
      flagsButtonPadding: EdgeInsets.only(left: 12.w, right: 8.w),
      initialCountryCode: 'EG',
      showDropdownIcon: false,
      onChanged: (phone) {
        phoneNumberController.text = phone.completeNumber;
      },
    );
  }
}
