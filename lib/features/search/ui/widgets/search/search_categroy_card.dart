import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchCategroyCard extends StatelessWidget {
  const SearchCategroyCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF5DE98),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildtitleImage(),
          verticalSpace(10),
          _buildtitleDetails(),
        ],
      ),
    );
  }

  Container _buildtitleImage() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: SvgPicture.asset(
        image,
        width: 40,
        fit: BoxFit.contain,
      ),
    );
  }

  Padding _buildtitleDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           title,
            style: TextStyles.font14BlackSemiBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(5),
          Text(
           description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font12BlackRegular,
          ),
        ],
      ),
    );
  }
}
