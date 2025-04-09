import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/checkout/payment_method_selection.dart';
import '../widgets/checkout/payment_summary_section.dart';
import '../widgets/checkout/voucher_text_form_field.dart';
import '../widgets/checkout/delivery_address_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Checkout'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(10),
                const DeliveryAddressCard(),
                verticalSpace(15),
                PaymentMethodSelection(
                  onSelectPaymentMethod: (String selectedPaymentMethod) {},
                ),
                const VoucherTextFormField(),
                verticalSpace(15),
                const PaymentSummarySection(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: AppTextButton(
            buttonText: 'Place Order',
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.paymentSuccessScreen,
                predicate: (route) => false,
              );
            }),

      ),
    );
  }
}
