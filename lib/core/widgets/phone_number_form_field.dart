import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import '../theming/styles.dart';

class PhoneNumberFormField extends StatelessWidget {
  const PhoneNumberFormField({
    super.key,
    required this.phoneController,
    this.isScrollPadding = false,
  });
  final TextEditingController phoneController;
  final bool isScrollPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        border: Border.all(
          width: 0.6,
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          _buildCountryCodePrefix(),
          horizontalSpace(5),
          Expanded(
            child: SizedBox(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 7),
                child: TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: isScrollPadding
                          ? MediaQuery.of(context).viewInsets.bottom
                          : 0),
                  controller: phoneController,
                  style: TextStyles.font13BlackMedium,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('^49+')),
                    LengthLimitingTextInputFormatter(11),
                  ],
                  cursorColor: ColorsManager.mainGreen,
                  cursorHeight: 18,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(height: 0),
                      border: InputBorder.none,
                      hintStyle: TextStyles.font13GreyMedium,
                      hintText: '151 12345678'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildCountryCodePrefix() {
    return Row(
      children: [
        const HugeIcon(
            icon: HugeIcons.strokeRoundedSmartPhone01,
            color: ColorsManager.mainGreen),
        horizontalSpace(8),
        SvgPicture.asset(
          Assets.svgsGermanFlag,
          width: 20,
        ),
        horizontalSpace(6),
        Text(
          '+49',
          style: TextStyles.font14BlackMedium,
        ),
        horizontalSpace(8),
        Container(
          width: 1,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
        )
      ],
    );
  }
}
