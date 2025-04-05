import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({
    super.key,
    required this.date,
    required this.time,
    required this.status,
  });
  final String date, time, status;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              date,
              style: TextStyles.font13GreySemiBold,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 3,
              ),
              child: CircleAvatar(
                radius: 3,
                backgroundColor: ColorsManager.grey,
              ),
            ),
            Text(
              time,
              style: TextStyles.font13GreySemiBold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.trackOrderScreen);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                    color: ColorsManager.lightGreen,
                    borderRadius: BorderRadius.circular(35)),
                child: Text(
                  status,
                  style: TextStyles.font14MainGreenSemiBold,
                ),
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: FractionallySizedBox(
            widthFactor: 1.06,
            child: Divider(
              thickness: 0.3,
            ),
          ),
        )
      ],
    );
  }
}
