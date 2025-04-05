import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../core/theming/colors.dart';
import 'navigation_items.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key, this.selectedIndex = 0});
  final int selectedIndex;
  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  late int _currentIndex;
  @override
  void initState() {
    _currentIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _currentIndex,
          children: navigationItems.map((item) => item.page).toList()),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 0.01, spreadRadius: 0.01)
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsManager.mainGreen,
          onTap: (int index) {
            HapticFeedback.selectionClick();
            setState(() => _currentIndex = index);
          },
          items: navigationItems.map((item) {
            bool isSelected = _currentIndex == navigationItems.indexOf(item);
            return BottomNavigationBarItem(
              icon: HugeIcon(
                icon: item.icon,
                size: 25,
                color: isSelected ? ColorsManager.mainGreen : Colors.grey,
              ),
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }
}
