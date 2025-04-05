import 'package:flutter/material.dart';
import 'order_card_header.dart';
import 'order_rating_section.dart';
import 'order_summary_section.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: const Column(
        children: [
          OrderCardHeader(
            date: 'Jan 28, 2025',
            time: '06:10 PM',
            status: 'Delivered',
          ),
          OrderSummarySection(
            orderPrice: '500.00',
            orderId: '123456',
            prdocutsCount: '2',
          ),
          OrderRatingSection(),
        ],
      ),
    );
  }
}
