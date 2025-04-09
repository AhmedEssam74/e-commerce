import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/google_or_apple_btn.dart';
import 'package:flutter/material.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleOrAppleBtn(
      iconAsset: Assets.svgsGoogle,
      lableText: "Continue with Google",
      onTap: ()  {},
    );
  }
}
