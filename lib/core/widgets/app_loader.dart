import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoader {
  static void show(BuildContext context, {Color? color, double? size}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: color ?? ColorsManager.mainGreen,
            size: size ?? 50,
          ),
        ),
      ),
    );
  }
}
