import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/routing/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dream home starts here',
            style: TextStyles.font20BlackBold,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const PositionedDirectional(
                top: -15,
                start: 0,
                end: 0,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Color(0xffE7B10A),
                ),
              ),
              verticalSpace(5),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.notificationsScreen);
                },
                child: const HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification02,
                    color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
