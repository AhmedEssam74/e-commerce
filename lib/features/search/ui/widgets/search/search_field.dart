import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../filter_search/filter_search_sheet.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.onChange,
  });
  final TextEditingController controller;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
        controller: controller,
        onChange: (value) {
          onChange(value);
        },
        prefixIcon: const HugeIcon(
          icon: HugeIcons.strokeRoundedSearch01,
          color: Colors.grey,
          size: 22,
        ),
        suffixIcon: _buildFilterIcon(context),
        hintText: 'Search by category here...',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        });
  }

  Padding _buildFilterIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.white,
            context: context,
            builder: (context) => const FilterSearchSheet(),
          );
        },
        child: const CircleAvatar(
          radius: 8,
          backgroundColor: ColorsManager.mainGreen,
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedFilterHorizontal,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
