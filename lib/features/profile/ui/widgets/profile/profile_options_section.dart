import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/features/profile/ui/widgets/profile/profile_option_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileOptionsSection extends StatelessWidget {
  const ProfileOptionsSection({super.key});

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
            icon: HugeIcons.strokeRoundedDeliveryBox01,
            title: 'My Orders',
            onTap: () {
              context.pushNamed(Routes.ordersScreen);
            },
          ),
          ProfileOptionCard(
            icon: HugeIcons.strokeRoundedGift,
            title: 'Vouchers',
            onTap: () {
              context.pushNamed(Routes.vouchersScreen);
            },
          ),
          ProfileOptionCard(
            icon: HugeIcons.strokeRoundedLocation01,
            title: 'Saved Addresses',
            isShowDivider: false,
            onTap: () {
              context.pushNamed(Routes.savedAddressesScreen);
            },
          ),
        ],
      ),
    );
  }
}
