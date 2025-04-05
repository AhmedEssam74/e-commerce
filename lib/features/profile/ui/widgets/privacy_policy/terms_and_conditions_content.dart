import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'terms_and_conditions_data.dart';

class TermsAndConditionsContent extends StatelessWidget {
  const TermsAndConditionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'Welcome to Heim! These Terms and Conditions govern your use of our mobile application and services. By accessing or using Heim, you agree to comply with these Terms. Please read them carefully.'),
        verticalSpace(20),
        ...List.generate(termsAndConditionsData.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  termsAndConditionsData[index]['title'],
                  style: TextStyles.font16BlackBold,
                ),
                verticalSpace(5),
                Text(
                  termsAndConditionsData[index]['subtitle'],
                )
              ],
            ),
          );
        })
      ],
    );
  }
}
