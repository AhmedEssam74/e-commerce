import 'dart:async';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % 5;
      });
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 120,
          child: FractionallySizedBox(
            widthFactor: 1.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() => currentIndex = value);
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildBannerItem(imageUrl: Assets.imagesHomeBanner);
                },
              ),
            ),
          ),
        ),
        _buildDotsIndicator(),
      ],
    );
  }

  Widget _buildBannerItem({required String imageUrl}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.only(bottom: 10, right: 5),
          width: currentIndex == index ? 30 : 10,
          height: 4,
          decoration: BoxDecoration(
            color: currentIndex == index ? ColorsManager.mainGreen : Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
