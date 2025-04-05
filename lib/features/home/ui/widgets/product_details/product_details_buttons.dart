import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/styles.dart';
import 'view_cart_text_button.dart';

class ProductDetailsButtons extends StatefulWidget {
  const ProductDetailsButtons({super.key});

  @override
  State<ProductDetailsButtons> createState() => _ProductDetailsButtonsState();
}

class _ProductDetailsButtonsState extends State<ProductDetailsButtons> {
  bool isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 900),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: isAddedToCart
              ? ViewCartTextButton(
                  key: const ValueKey('viewCartButton'),
                  onPressed: () {
                    context.pushNamedAndRemoveUntil(
                      Routes.mainNavigationBar,
                      predicate: (route) => false,
                      arguments: 3,
                    );
                  },
                )
              : Row(
                  key: const ValueKey('addToCartRow'),
                  children: [
                    Expanded(
                      child: _buildQuantityControl(),
                    ),
                    horizontalSpace(15),
                    Expanded(
                      child: AppTextButton(
                        key: const ValueKey('addToCartButton'),
                        buttonText: 'Add to cart',
                        onPressed: () {
                          setState(() {
                            isAddedToCart = true;
                          });
                          HapticFeedback.selectionClick();
                        },
                      ),
                    ),
                  ],
                ),
        ),
        verticalSpace(50),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.mainGreen),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              HapticFeedback.selectionClick();
            },
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedMinusSign,
              color: ColorsManager.mainGreen,
              size: 22,
            ),
          ),
          Text(
            '2',
            style: TextStyles.font14BlackBold,
          ),
          IconButton(
            onPressed: () {
              HapticFeedback.selectionClick();
            },
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedPlusSign,
              color: ColorsManager.mainGreen,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
