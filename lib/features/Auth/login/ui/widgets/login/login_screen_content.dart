import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/google_btn.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/login/auth_toggle.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/divider_widget.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/login/login_form.dart';
import 'package:flutter/material.dart';
import '../../../../signup/ui/signup_screen.dart';

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  int _selectedIndex = 0;

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
            children: [
              verticalSpace(10),
              AuthToggle(
                onLoginPressed: (int selectedIndex) {
                  setState(() {
                    _selectedIndex = selectedIndex;
                  });
                },
              ),
              verticalSpace(30),
              if (_selectedIndex == 0)
                Column(
                  children: [
                    const LoginForm(),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: "Continue_as_a_guest".tr(),
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
                )
              else
                const SignupScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
