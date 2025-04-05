import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/styles.dart';

class VoucherTextFormField extends StatelessWidget {
  const VoucherTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Save 10% on your order', style: TextStyles.font16BlackBold),
        verticalSpace(10),
        AppTextFormField(
          hintText: 'Enter voucher code',
          borderRadius: 12,
          prefixIcon: const HugeIcon(
            icon: HugeIcons.strokeRoundedDiscount,
            color: ColorsManager.mainGreen,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(top: 13,end: 15),
            child: Text(
              'Apply',
              style: TextStyles.font14MainGreenSemiBold,
            ),
          ),
          validator: (value) {},
        ),
      ],
    );
  }
}
