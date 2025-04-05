import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.orderId,
    required this.date,
  });

  final String orderId, date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0x20E7B10A),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOrderPlacedTextSpan(),
                _buildOrderIdTextSpan(),
              ],
            ),
          ),
        ),
        const PositionedDirectional(
          top: -25,
          child: CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
          ),
        ),
        const PositionedDirectional(
          top: -20,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xffE7B10A),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedDeliveryBox01,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderPlacedTextSpan() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Order placed:',
            style: TextStyles.font12BlackBold,
          ),
          TextSpan(
            text: ' $date',
            style: TextStyles.font12BlackMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderIdTextSpan() {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Order ID:',
              style: TextStyles.font12BlackBold,
            ),
            TextSpan(
              text: ' #$orderId',
              style: TextStyles.font12BlackMedium,
            ),
          ],
        ),
      ),
    );
  }
}
