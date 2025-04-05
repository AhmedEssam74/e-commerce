import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/full_sheet_app_bar.dart';

class ReturnOrderSheet extends StatelessWidget {
  const ReturnOrderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FullSheetAppBar(
            title: 'Return Order',
            subTitle: 'Manage your order return process',
          ),
          Text(
            'Are you sure you want to return your order? You can return the order within 4 weeks from your order date. You’ll get an exclusive voucher with order price and you can enjoy purchasing your favorite products from Heim store anytime',
            style: TextStyles.font12BlackRegular.copyWith(
              color: ColorsManager.grey,
            ),
          ),
          verticalSpace(20),
          AppTextButton(
            buttonText: 'Confirm',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
