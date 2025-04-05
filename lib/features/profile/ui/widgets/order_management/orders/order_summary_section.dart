import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/features/profile/ui/widgets/order_management/orders/order_summary_product_card.dart';
import 'package:ecommerce/features/profile/ui/widgets/order_management/orders/toggle_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../../core/theming/colors.dart';

class OrderSummarySection extends StatefulWidget {
  const OrderSummarySection({
    super.key,
    required this.orderPrice,
    required this.orderId,
    required this.prdocutsCount,
  });
  final String orderPrice, orderId, prdocutsCount;
  @override
  State<OrderSummarySection> createState() => _OrderSummarySectionState();
}

class _OrderSummarySectionState extends State<OrderSummarySection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildOrderSummaryRow(),
        verticalSpace(15),
        AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          child: isExpanded
              ? Column(
                  children: List.generate(
                    2,
                    (index) => const OrderSummaryProductCard(
                      image: Assets.imagesArrivalChair,
                      orderName: 'Blush luxe chair',
                      orderId: '123456789',
                      price: '500.00',
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        const FractionallySizedBox(
          widthFactor: 1.06,
          child: Divider(
            thickness: 0.3,
          ),
        ),
        verticalSpace(5),
      ],
    );
  }

  Row _buildOrderSummaryRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildOrderDetails(),
        _buildProductCountAndToggle(),
      ],
    );
  }

  Expanded _buildOrderDetails() {
    return Expanded(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: ColorsManager.lightGreen,
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedDeliveryBox01,
              color: ColorsManager.mainGreen,
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${widget.orderPrice}',
                  style: TextStyles.font14BlackMedium,
                ),
                verticalSpace(5),
                Text(
                  'Order ID:#${widget.orderId}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14GreyRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildProductCountAndToggle() {
    return Row(
      children: [
        Text(
          '${widget.prdocutsCount} Products',
          style: TextStyles.font14GreyRegular,
        ),
        horizontalSpace(5),
        ToggleArrowIcon(
          onToggle: (bool value) {
            setState(() {
              isExpanded = value;
            });
          },
        ),
      ],
    );
  }
}
