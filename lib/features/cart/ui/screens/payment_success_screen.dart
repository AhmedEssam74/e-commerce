import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../widgets/checkout/payment_success_content.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Payment Success'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpace(10),
                const Center(child: PaymentSuccessContent()),
                verticalSpace(25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
