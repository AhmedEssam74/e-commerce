import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/login/login_screen_content.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/login/auth_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.mainGreen,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        AuthHeader(),
        LoginScreenContent(),
        ],
      )),
    );
  }
}
