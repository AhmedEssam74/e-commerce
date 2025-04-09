import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppErrorDialog {
  static void showErrorDialog(
    BuildContext context, {
    required String message,
    String title = 'Error',
    String buttonText = 'OK',
    void Function()? onConfirm,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    TextStyle? buttonStyle,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: titleStyle ??  TextStyles.font16BlackBold,
        ),
        content: Text(
          message,
          style: messageStyle ?? TextStyles.font14MainGreenSemiBold,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(
              buttonText,
              style: buttonStyle ?? TextStyles.font14MainGreenSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
