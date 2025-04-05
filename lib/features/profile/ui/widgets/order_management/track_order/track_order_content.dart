import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/routing/routes.dart';
import 'order_status_card.dart';
import 'order_tracking_stepper.dart';
import 'return_order_sheet.dart';

class TrackOrderContent extends StatelessWidget {
  const TrackOrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderStatusCard(
          date: ' 30/01/2025',
          orderId: '123456',
        ),
        verticalSpace(30),
        OrderTrackingStepper(),
        verticalSpace(40),
        AppTextButton(
            buttonText: 'Return Order',
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => const ReturnOrderSheet());
            }),
        verticalSpace(20),
        AppTextButton(
          backgroundColor: Colors.transparent,
          borderColor: ColorsManager.mainGreen,
          textStyle: TextStyles.font16MainGreenMedium,
          buttonText: 'Continue Shopping',
          onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.mainNavigationBar,
                predicate: (route) => false);
          },
        ),
      ],
    );
  }
}
