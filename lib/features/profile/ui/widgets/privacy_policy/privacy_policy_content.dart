import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';

import 'privacy_policy_data.dart';

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'Welcome to Heim! Your privacy is important to us. This Privacy Policy explains how we collect, use, store, and protect your personal information when you use our application (Heim) and related services. By using our app, you agree to the terms outlined below'),
        verticalSpace(20),
        ...List.generate(privacyPolicyData.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  privacyPolicyData[index]['title'],
                  style: TextStyles.font16BlackBold,
                ),
                verticalSpace(5),
                Text(
                  privacyPolicyData[index]['subtitle'],
                )
              ],
            ),
          );
        })
      ],
    );
  }
}
