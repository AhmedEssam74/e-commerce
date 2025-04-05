import 'package:flutter/material.dart';
import 'order_status_step.dart';

class OrderTrackingStepper extends StatelessWidget {
  OrderTrackingStepper({super.key});
  final List<String> orderStatuses = [
    'Placed',
    'Preparing',
    'Shipping',
    'Returned',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(4, (index) {
          return OrderStatusStep(
            orderStatus: orderStatuses[index],
            date: 'Monday 30/01/2025',
            isActive: index != 3,
            isShowDots: index != 3,
          );
        })
      ],
    );
  }
}
