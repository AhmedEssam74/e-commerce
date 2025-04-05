import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/profile/ui/widgets/order_management/orders/order_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/secondary_appbar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'My Orders'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(15),
            const OrderListView(),
          ],
        ),
      )),
    );
  }
}
