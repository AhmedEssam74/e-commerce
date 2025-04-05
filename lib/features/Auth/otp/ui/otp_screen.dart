import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/Auth/otp/ui/widgets/otp_image_and_text.dart';
import 'package:ecommerce/features/Auth/otp/ui/widgets/resend_otp_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import 'widgets/otp_pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  const OtpImageAndText(),
                  const OtpPinput(),
                  verticalSpace(30),
                  const ResendOtpText(),
                  verticalSpace(35),
                  AppTextButton(
                      buttonText: 'Get Started',
                      onPressed: () {
                        context.pushNamed(Routes.mainNavigationBar);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
