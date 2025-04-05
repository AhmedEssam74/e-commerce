import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ForgotPasswordAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ForgotPasswordAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: GestureDetector(
          onTap: context.pop,
          child: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
