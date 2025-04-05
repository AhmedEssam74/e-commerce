import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/features/onBoarding/ui/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'on_boarding_pages.dart';

// ignore: must_be_immutable
class OnBoardingPageView extends StatefulWidget {
  OnBoardingPageView(
      {super.key,
      required this.pageController,
      required this.currentPage,
      required this.onChangeCurrentPage});
  final PageController pageController;
  int currentPage;
  final Function(int currentPage) onChangeCurrentPage;
  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  void changePage(int index) {
    setState(() {
      widget.currentPage = index;
      widget.onChangeCurrentPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: widget.pageController,
              onPageChanged: (value) {
                changePage(value);
              },
              children: [
                buildFirstPage(),
                buildSecondPage(),
                buildThirdPage(),
                buildFourthPage(),
              ],
            ),
          ),
          verticalSpace(20),
          OnBoardingButton(
            currentPage: widget.currentPage,
            onPress: () {
              navigateToLoginScreen();
            },
          ),
        ],
      ),
    );
  }

  void navigateToLoginScreen() {
    if (widget.currentPage < 3) {
      widget.pageController.animateToPage(widget.currentPage + 1,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      context.pushReplacementNamed(Routes.loginScreen);
    }
    HapticFeedback.selectionClick();
  }
}
