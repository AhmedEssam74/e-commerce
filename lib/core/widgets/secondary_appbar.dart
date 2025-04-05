import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onBackPressed;

  const SecondaryAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: onBackPressed ?? Navigator.of(context).pop,
        child: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyles.font20BlackBold,
      ),
      actions: [trailing ?? const SizedBox()],
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
