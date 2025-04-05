import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class FilterPriceRange extends StatefulWidget {
  const FilterPriceRange({super.key, required this.onSelected});
  final Function(RangeValues rangeValues) onSelected;
  @override
  State<FilterPriceRange> createState() => _FilterPriceRangeState();
}

class _FilterPriceRangeState extends State<FilterPriceRange> {
  RangeValues _currentRangeValues = const RangeValues(100, 400);
@override
  void initState() {
    widget.onSelected(_currentRangeValues);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 500,
          divisions: 10,
          activeColor: ColorsManager.mainGreen,
          inactiveColor: const Color(0x38535353),
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ), // Optional: Display current values
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
               widget.onSelected(_currentRangeValues);
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '\$${_currentRangeValues.start.round()},00',
              style: TextStyles.font16BlackSemiBold,
            ),
            Text(
              '\$${_currentRangeValues.end.round()},00',
              style: TextStyles.font16BlackSemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
