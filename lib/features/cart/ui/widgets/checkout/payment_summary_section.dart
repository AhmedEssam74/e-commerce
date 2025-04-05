import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class PaymentSummarySection extends StatelessWidget {
  const PaymentSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Summary', style: TextStyles.font16BlackBold),
        verticalSpace(10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 0.8),
          ),
          child: Column(
            children: [
              _buildPaymentSummaryRow(
                text: 'Subtotal',
                price: '120.00',
              ),
              _buildPaymentSummaryRow(
                  text: 'Discount', price: '-20.00', isGreenColor: true),
              _buildPaymentSummaryRow(
                text: 'Delivery fee',
                price: '10.20',
                isShowIcon: true,
              ),
              _buildPaymentSummaryRow(
                text: 'Service fee',
                price: '10.20',
                isShowDivider: false,
                isShowIcon: true,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(color: ColorsManager.lightGreen,),
                child: _buildPaymentSummaryRow(
                    text: 'Total Amount',
                    price: '250.20',
                    isGreenColor: true,
                    isMainGreenColor: true,
                    isShowDivider: false),
              ),
            ],
          ),
        ),
        verticalSpace(25),
      ],
    );
  }

  Column _buildPaymentSummaryRow({
    required String text,
    required String price,
    bool isGreenColor = false,
    bool isMainGreenColor = false,
    bool isShowDivider = true,
    bool isShowIcon = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Text(text,
                    style: TextStyles.font14GreyRegular.copyWith(
                        color: isMainGreenColor
                            ? ColorsManager.mainGreen
                            : ColorsManager.grey,
                        fontSize: isMainGreenColor ? 18 : 14)),
                if (isShowIcon)
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 8),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedInformationCircle,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Text('\$$price',
                style: TextStyles.font14BlackSemiBold.copyWith(
                    fontSize: isMainGreenColor ? 18 : 14,
                    color:
                        isGreenColor ? ColorsManager.mainGreen : Colors.black)),
          ],
        ),
        if (isShowDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(
              thickness: 0.3,
            ),
          )
      ],
    );
  }
}
