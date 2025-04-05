import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class SocialSignInButton extends StatelessWidget {
  const SocialSignInButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.6,
            ),
            borderRadius: BorderRadius.circular(65),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 25,
              ),
              horizontalSpace(10),
              Text(
                title,
                style: TextStyles.font14BlackMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
