import 'package:ecommerce/features/profile/ui/widgets/order_management/orders/no_orders_widget.dart';
import 'package:flutter/material.dart';
import 'order_card.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: true,
        replacement: const NoOrdersWidget(),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const OrderCard();
          },
        ),
      ),
    );
  }
}
