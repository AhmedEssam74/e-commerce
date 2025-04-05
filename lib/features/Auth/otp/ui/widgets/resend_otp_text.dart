import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart'; // Import spacing
import '../../../../../core/theming/styles.dart'; // Import your styles

class ResendOtpText extends StatelessWidget {
  const ResendOtpText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Text(
            "Didn't receive code?",
            style: TextStyles.font14BlackRegular,
          ),
          verticalSpace(5),
          Text(
            'Resend',
            style: TextStyles.font14MainGreenSemiBold,
          ),
        ],
      ),
    );
  }
}
