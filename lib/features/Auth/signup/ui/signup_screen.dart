import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupForm(),
        verticalSpace(50),
        AppTextButton(buttonText: 'Sign up', onPressed: () {}),
        verticalSpace(20),
      ],
    );
  }
}
