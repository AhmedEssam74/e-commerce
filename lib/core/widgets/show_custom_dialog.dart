import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// General-purpose dialog for delete, error, and success scenarios
Future<dynamic> showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  required IconData icon,
  required Color iconColor,
  required String primaryButtonText,
  VoidCallback? onPrimaryPressed,
  String? secondaryButtonText,
  VoidCallback? onSecondaryPressed,
}) {
  return showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: iconColor, width: 2.5),
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  // Edit from withValues (alpha :.2)
                  backgroundColor: iconColor.withAlpha(2),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 27,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(15),
                      Text(
                        title,
                        style: TextStyles.font16BlackBold,
                      ),
                      verticalSpace(3),
                      Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font16BlackBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                if (secondaryButtonText != null)
                  Expanded(
                    child: AppTextButton(
                      buttonText: secondaryButtonText,
                      buttonHeight: 20,
                      onPressed: () {
                        if (onSecondaryPressed != null) {
                          onSecondaryPressed();
                        }
                        Navigator.of(context).pop();
                      },
                      textStyle: TextStyles.font16BlackBold,
                      borderColor: Colors.grey,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                if (secondaryButtonText != null) horizontalSpace(10),
                Expanded(
                  child: AppTextButton(
                    buttonText: primaryButtonText,
                    buttonHeight: 20,
                    onPressed:
                        onPrimaryPressed ?? () => Navigator.of(context).pop(),
                    textStyle: TextStyles.font16BlackBold,
                    backgroundColor: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
