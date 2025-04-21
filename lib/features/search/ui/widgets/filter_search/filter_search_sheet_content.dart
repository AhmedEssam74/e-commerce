import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'filter_check_box_list.dart';
import 'filter_price_range.dart';

class FilterSearchSheetContent extends StatelessWidget {
  const FilterSearchSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        // Text(
        //   'Popular Filters',
        //   style: TextStyles.font16BlackSemiBold,
        // ),
        // verticalSpace(15),
        // FilterCheckBoxList(
        //   items: const ['Best Seller', 'New arrivals', 'Last chance offers'],
        //   onSelected: (List<dynamic> selectedItems) {},
        // ),
        // verticalSpace(20),
        // Text(
        //   'Offers & Values',
        //   style: TextStyles.font16BlackSemiBold,
        // ),
        // verticalSpace(15),
        // FilterCheckBoxList(
        //   items: const ['Free shipping', 'Hot deals'],
        //   onSelected: (List<dynamic> selectedItems) {},
        // ),
        // verticalSpace(20),
        Text(
          'Sort By',
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(15),
        FilterCheckBoxList(
          items: const ['Low to High price', 'High to Low price'],
          onSelected: (List<dynamic> selectedItems) {},
        ),
        verticalSpace(20),
        Text(
          'Price Range',
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(10),
        FilterPriceRange(
          onSelected: (RangeValues rangeValues) {},
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: AppTextButton(
                backgroundColor: Colors.transparent,
                borderColor: ColorsManager.mainGreen,
                textStyle: TextStyles.font16MainGreenMedium,
                buttonText: 'Clear All',
                onPressed: () {},
              ),
            ),
            horizontalSpace(15),
            Expanded(
              child: AppTextButton(
                buttonText: 'Apply',
                onPressed: () {},
              ),
            ),
          ],
        ),
        // verticalSpace(25),
      ],
    );
  }
}
