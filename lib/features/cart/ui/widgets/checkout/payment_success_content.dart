import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_button.dart';

class PaymentSuccessContent extends StatelessWidget {
  const PaymentSuccessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.svgsPaymentSuccess,
          fit: BoxFit.contain,
        ),
        verticalSpace(20),
        Text(
          'Your order has been successfully\nplaced!',
          textAlign: TextAlign.center,
          style: TextStyles.font20BlackBold,
        ),
        verticalSpace(20),
        Text(
          'Thank you for choosing Heim. Your order #123456789 is confirmed and will be processed shortly. We’ll send you updates on your order so make sure to turn on your notifications. In the meantime, you can track your order in the "My Orders" section.',
          textAlign: TextAlign.center,
          style: TextStyles.font14GreyRegular,
        ),
        verticalSpace(20),
        AppTextButton(
          backgroundColor: Colors.transparent,
          borderColor: ColorsManager.mainGreen,
          textStyle: TextStyles.font16MainGreenMedium,
          buttonText: 'Continue shopping',
          onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.mainNavigationBar,
                predicate: (route) => false, arguments: 0);
          },
        ),
      ],
    );
  }
}
