import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/order_management/track_order/track_order_content.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Track Order'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(25),
                const TrackOrderContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
