import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard(
      {super.key,
      required this.image,
      required this.orderName,
      required this.orderId,
      required this.price});
  final String image, orderName, orderId, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              image,
              width: 55,
              fit: BoxFit.contain,
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderName,
                  style: TextStyles.font14BlackMedium,
                ),
                verticalSpace(5),
                Text(
                  'Order ID:#$orderId',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14GreyRegular,
                ),
              ],
            ),
          ),
          verticalSpace(15),
          Text(
            '\$$price',
            style: TextStyles.font12BlackSemiBold,
          ),
        ],
      ),
    );
  }
}
