import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/home/ui/widgets/sub_categories/sub_categories_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/secondary_appbar.dart';
import '../widgets/categories/category_grid_view.dart';
import '../widgets/categories/category_list_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Categories'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(10),
            const CategoryListView(),
            verticalSpace(25),
            const SubCategoriesWidget(),
            verticalSpace(12),
            const CategoryGridView(),
          
          ],
        ),
      )),
    );
  }
}
