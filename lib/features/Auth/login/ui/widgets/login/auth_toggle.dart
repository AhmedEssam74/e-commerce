import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';

class AuthToggle extends StatefulWidget {
  const AuthToggle({super.key, required this.onLoginPressed});
  final Function(int selectedIndex) onLoginPressed;
  @override
  State<AuthToggle> createState() => _AuthToggleState();
}

class _AuthToggleState extends State<AuthToggle> {
  int _selectedIndex = 0;

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onLoginPressed(_selectedIndex);
     
    });
    HapticFeedback.selectionClick();
  }

  bool get _isLoginSelected => _selectedIndex == 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65),
        color: const Color(0x50D9D9D9),
      ),
      child: Row(
        children: [
          _buildTab(
            title: 'Login',
            isSelected: _isLoginSelected,
            index: 0,
          ),
          horizontalSpace(15),
          _buildTab(
            title: 'Sign up',
            isSelected: !_isLoginSelected,
            index: 1,
          ),
        ],
      ),
    );
  }

  Expanded _buildTab({
    required String title,
    required bool isSelected,
    required int index,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTab(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: isSelected ? ColorsManager.mainGreen : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: isSelected
                  ? TextStyles.font14WhiteMedium
                  : TextStyles.font14GreyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
