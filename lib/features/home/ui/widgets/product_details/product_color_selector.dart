import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/theming/colors.dart';

class ProductColorSelector extends StatefulWidget {
  const ProductColorSelector({super.key});

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
              HapticFeedback.selectionClick();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              padding: const EdgeInsetsDirectional.all(3),
              margin: const EdgeInsetsDirectional.only(end: 5),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected
                        ? ColorsManager.mainGreen
                        : Colors.transparent,
                    width: 1),
              ),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries[index],
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
