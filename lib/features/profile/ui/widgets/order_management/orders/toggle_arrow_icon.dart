import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';

class ToggleArrowIcon extends StatefulWidget {
  const ToggleArrowIcon({super.key, required this.onToggle});
  final Function(bool isEpanded) onToggle;
  @override
  State<ToggleArrowIcon> createState() => _ToggleArrowIconState();
}

class _ToggleArrowIconState extends State<ToggleArrowIcon> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() {
          _isExpanded = !_isExpanded;
          widget.onToggle(_isExpanded);
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _isExpanded
            ? const HugeIcon(
                key: ValueKey('arrowUp'),
                icon: HugeIcons.strokeRoundedArrowUp01,
                color: Colors.grey,
              )
            : const HugeIcon(
                key: ValueKey('arrowDown'),
                icon: HugeIcons.strokeRoundedArrowDown01,
                color: Colors.grey,
              ),
      ),
    );
  }
}
