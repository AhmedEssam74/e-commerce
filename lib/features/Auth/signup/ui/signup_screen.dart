import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/google_btn.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupForm(),
        verticalSpace(20),
        AppTextButton(
          buttonText: "Continue as a guest",
          backgroundColor: Colors.transparent,
          textStyle: TextStyles.font16MainGreenMedium,
          borderColor: ColorsManager.mainGreen,
          onPressed: () {
            context.pushNamed(Routes.homeScreen);
          },
        ),
        verticalSpace(20),
        const DividerWidget(),
        verticalSpace(12),
        Row(
          children: [
            const GoogleBtn(),
            verticalSpace(16),
          ],
        ),
      ],
    );
  }
}
