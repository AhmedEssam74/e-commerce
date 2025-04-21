import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/full_sheet_app_bar.dart';

class SubCategoriesWidget extends StatelessWidget {
  const SubCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'SubCategories',
          style: TextStyles.font18BlackSemiBold,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => _subCategorySection(context),
            );
          },
          child: Text(
            'See more',
            style: TextStyles.font16BlackBold,
          ),
        ),
      ],
    );
  }

  Widget _subCategorySection(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height - 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FullSheetAppBar(
              title: 'Sub-Categories',
              subTitle: 'Choose sub-category',
            ),
            verticalSpace(10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => verticalSpace(14),
                itemCount: 20,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(14.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManager.lightGreen,
                    border: Border.all(color: Colors.grey, width: 0.6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text("Sub-category ${index + 1}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
