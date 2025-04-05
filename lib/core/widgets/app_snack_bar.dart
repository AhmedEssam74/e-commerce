import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static showSnackBarWidget(
      {required BuildContext context,
      required String message,
      Color statusColor = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: statusColor,
        elevation: 3,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font14WhiteMedium,
        ),
      ),
    );
  }
}
