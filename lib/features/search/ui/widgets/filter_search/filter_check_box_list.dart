import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class FilterCheckBoxList extends StatefulWidget {
  const FilterCheckBoxList({
    super.key,
    required this.items,
    required this.onSelected,
  });
  final List<String> items;
  final Function(List selectedItems) onSelected;
  @override
  State<FilterCheckBoxList> createState() => _FilterCheckBoxListState();
}

class _FilterCheckBoxListState extends State<FilterCheckBoxList> {
  List selectedItems = [];
  void onSelected({required int index}) {
    HapticFeedback.selectionClick();
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index);
      } else {
        selectedItems.add(index);
      }
    });
    widget.onSelected(selectedItems);
  }

  bool isSelected(int index) => selectedItems.contains(index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.items.length, (index) {
        return _buildCheckListRow(
          title: widget.items[index],
          isChecked: isSelected(index),
          isShowDivider: index != widget.items.length - 1,
          onTap: () {
            onSelected(index: index);
          },
        );
      }),
    );
  }

  GestureDetector _buildCheckListRow(
      {required String title,
      required bool isChecked,
      required VoidCallback onTap,
      required bool isShowDivider}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyles.font14BlackRegular,
              ),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                decoration: BoxDecoration(
                  color:
                      isChecked ? ColorsManager.mainGreen : Colors.transparent,
                  border: Border.all(color: ColorsManager.mainGreen),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedTick01,
                  color: isChecked ? Colors.white : Colors.transparent,
                  size: 23,
                ),
              )
            ],
          ),
          if (isShowDivider)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                thickness: 0.3,
              ),
            ),
        ],
      ),
    );
  }
}
