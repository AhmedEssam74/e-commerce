import 'package:ecommerce/features/Auth/login/ui/widgets/login/auth_header.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/forgot_password/forgot_password_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theming/colors.dart';
import '../widgets/forgot_password/forgot_password_content.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.mainGreen,
      appBar: ForgotPasswordAppbar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeader(
              title: 'Forget your password',
              subTitle: 'Reset a new password to your account',
            ),
            ForgotPasswordContent(),
          ],
        ),
      ),
    );
  }
}
