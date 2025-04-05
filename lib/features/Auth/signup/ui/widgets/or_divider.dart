import 'package:flutter/material.dart';
import '../../../../../core/theming/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key,  this.text='login'});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.6,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Or $text with',
            style: TextStyles.font11GreyMedium,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.6,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}