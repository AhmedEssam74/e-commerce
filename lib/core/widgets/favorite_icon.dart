import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_images.dart';

// ignore: must_be_immutable
class FavoriteIcon extends StatefulWidget {
  FavoriteIcon({super.key, required this.isFavourite});
  bool isFavourite;
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(() => widget.isFavourite = !widget.isFavourite),
        HapticFeedback.selectionClick()
      },
      child: Container(
        width: 40,
        height: 40,
        
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorsManager.mainGreen,
            borderRadius: BorderRadius.circular(8)),
        child: SvgPicture.asset(
          widget.isFavourite ? Assets.svgsHeartFill : Assets.svgsHeartOutline,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
