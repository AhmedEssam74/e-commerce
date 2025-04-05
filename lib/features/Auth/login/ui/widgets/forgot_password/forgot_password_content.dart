import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'forgot_password_form.dart';

class ForgotPasswordContent extends StatelessWidget {
  const ForgotPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              Text(
                'Reset new password',
                style: TextStyles.font18lackSemiBold,
              ),
              verticalSpace(20),
              const ForgotPasswordForm(),
              verticalSpace(20),
              AppTextButton(buttonText: 'Reset password', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
