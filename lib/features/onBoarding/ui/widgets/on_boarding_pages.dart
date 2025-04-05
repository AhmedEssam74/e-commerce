import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

Widget buildFirstPage() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(Assets.imagesOnBoardingImage1,
                        fit: BoxFit.cover),
                    verticalSpace(15),
                    Image.asset(Assets.imagesOnBoardingImage3,
                        fit: BoxFit.cover),
                  ],
                ),
              ),
              horizontalSpace(15),
              Expanded(
                  child: Image.asset(Assets.imagesOnBoardingImage2,
                      fit: BoxFit.cover)),
            ],
          ),
          verticalSpace(15),
          Image.asset(Assets.imagesOnBoardingImage4, fit: BoxFit.cover),
          verticalSpace(35),
          _buildTextSection(
            title: 'Welcome to Heim!',
            description:
                'Discover beautifully crafted furniture that transforms your house into a warm, inviting, and personalized home you\'ll love.',
          ),
        ],
      ),
    ),
  );
}

Widget buildSecondPage() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.imagesOnBoardingImage5, fit: BoxFit.cover),
          verticalSpace(35),
          _buildTextSection(
            title: 'Find your perfect style',
            description:
                'Browse through our expertly curated collections, designed to perfectly match your unique taste, lifestyle, and the space you call home.',
          ),
        ],
      ),
    ),
  );
}

Widget buildThirdPage() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(Assets.imagesOnBoardingImage6, fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: Image.asset(Assets.imagesChairLine),
              ),
              PositionedDirectional(
                top: -20,
                start: 0,
                end: 0,
                child: Image.asset(Assets.imagesChair,
                    fit: BoxFit.contain, height: 370),
              ),
            ],
          ),
          verticalSpace(35),
          _buildTextSection(
            title: 'Shop, visualize & enjoy!',
            description:
                'Effortlessly shop for high-quality furniture and use our advanced tools to preview how each piece will look and fit in your space before making a purchase.',
          ),
        ],
      ),
    ),
  );
}

Widget buildFourthPage() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.imagesOnBoardingImage7, fit: BoxFit.fill),
          verticalSpace(35),
          _buildTextSection(
            title: 'Let’s create your dream space',
            description:
                'Join Heim today to explore endless possibilities, discover furniture tailored to your unique style, and start creating a home that truly reflects your personality and comfort.',
          ),
        ],
      ),
    ),
  );
}

/// A reusable method for the text section to reduce redundancy.
Widget _buildTextSection({required String title, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyles.font20BlackSemiBold),
      verticalSpace(10),
      Text(description,
          style: TextStyles.font14GreyRegular.copyWith(height: 1.7)),
    ],
  );
}
