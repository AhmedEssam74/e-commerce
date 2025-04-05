import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength});
  final bool hasLowerCase,
      hasUpperCase,
      hasNumber,
      hasSpecialCharacter,
      hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          text: 'At least 1 lowercase letter',
          hasValidated: hasLowerCase,
        ),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least 1 uppercase letter',
          hasValidated: hasUpperCase,
        ),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least 1 special character',
          hasValidated: hasSpecialCharacter,
        ),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least 1 number letter',
          hasValidated: hasNumber,
        ),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least 8 characters long letter',
          hasValidated: hasMinLength,
        ),
      ],
    );
  }

  Row buildValidationRow({required String text, required bool hasValidated}) {
    return Row(
      children: [
        HugeIcon(
          icon: HugeIcons.strokeRoundedCheckmarkCircle01,
          color: hasValidated ? ColorsManager.mainGreen : Colors.grey,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font12MainGreenRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: ColorsManager.mainGreen,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.mainGreen : Colors.grey,
          ),
        )
      ],
    );
  }
}
