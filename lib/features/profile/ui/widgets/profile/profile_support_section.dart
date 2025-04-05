import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/features/profile/ui/widgets/profile/profile_option_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/routing/routes.dart';

class ProfileSupportSection extends StatelessWidget {
  const ProfileSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: Column(
        children: [
          ProfileOptionCard(
            icon: HugeIcons.strokeRoundedSecurityCheck,
            title: 'Privacy policy',
            onTap: () {
              context.pushNamed(Routes.privacyPolicyScreen);
            },
          ),
          ProfileOptionCard(
            icon: HugeIcons.strokeRoundedCustomerService02,
            title: 'Contact us',
            onTap: () {},
          ),
          ProfileOptionCard(
            icon: HugeIcons.strokeRoundedInformationCircle,
            title: 'About Hiem',
            isShowDivider: false,
            onTap: () {  context.pushNamed(Routes.aboutHeimScreen);},
          ),
        ],
      ),
    );
  }
}
