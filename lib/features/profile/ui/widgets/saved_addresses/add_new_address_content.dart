import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/features/profile/ui/widgets/saved_addresses/set_default_address_card.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class AddNewAddressContent extends StatelessWidget {
  const AddNewAddressContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First address Name',
                      style: TextStyles.font14GreyMedium),
                  verticalSpace(10),
                  AppTextFormField(
                    hintText: 'First name',
                    validator: (value) {},
                  ),
                ],
              ),
            ),
            horizontalSpace(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Last address name', style: TextStyles.font14GreyMedium),
                  verticalSpace(10),
                  AppTextFormField(
                    hintText: 'Last name',
                    validator: (value) {},
                  ),
                ],
              ),
            )
          ],
        ),
        verticalSpace(15),
        Text('Str. name', style: TextStyles.font14GreyMedium),
        verticalSpace(10),
        AppTextFormField(
          hintText: 'Elm Street',
          validator: (value) {},
        ),
        verticalSpace(15),
        Text('House number', style: TextStyles.font14GreyMedium),
        verticalSpace(10),
        AppTextFormField(
          hintText: '16A',
          validator: (value) {},
        ),
        verticalSpace(15),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ZIP code', style: TextStyles.font14GreyMedium),
                  verticalSpace(10),
                  AppTextFormField(
                    isScrollPadding: true,
                    hintText: '123456',
                    validator: (value) {},
                  ),
                ],
              ),
            ),
            horizontalSpace(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City name', style: TextStyles.font14GreyMedium),
                  verticalSpace(10),
                  AppTextFormField(
                    isScrollPadding: true,
                    hintText: 'Frankfurt',
                    validator: (value) {},
                  ),
                ],
              ),
            )
          ],
        ),
        verticalSpace(20),
        const SetDefaultAddressCard(),
        AppTextButton(buttonText: 'Save', onPressed: () {}),
        verticalSpace(30)
      ],
    );
  }
}
