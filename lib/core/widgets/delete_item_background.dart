import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DeleteItemBackground extends StatelessWidget {
  const DeleteItemBackground({super.key,  this.deleteIconSize=30});
final double deleteIconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsetsDirectional.only(end: 20), // Reduced padding
      alignment: AlignmentDirectional.centerEnd,
      decoration: BoxDecoration(
        color: const Color(0xffFFD8D7),
        borderRadius: BorderRadius.circular(15),
      ),
      child:  HugeIcon(
        icon: HugeIcons.strokeRoundedDelete03,
        color: const Color(0xffA10000),
        size: deleteIconSize, // Increased icon size for better visibility
      ),
    );
  }
}