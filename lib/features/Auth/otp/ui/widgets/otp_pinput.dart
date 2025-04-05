import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/theming/styles.dart';

class OtpPinput extends StatelessWidget {
  const OtpPinput({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyles.font20MainGreenSemiBold,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.mainGreen),
        borderRadius: BorderRadius.circular(25),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorsManager.mainGreen),
      borderRadius: BorderRadius.circular(25),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: ColorsManager.mainGreen,
        ),
        textStyle: defaultPinTheme.textStyle!.copyWith(color: Colors.white));
    return Pinput(
      length: 6,

      controller: TextEditingController(),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      cursor: Container(
        width: 12,
        height: 2.5,
        color: ColorsManager.mainGreen,
      ),
      // validator: (s) {
      //   return s == '123456' ? null : 'Pin is incorrect';
      // },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
    );
  }
}
