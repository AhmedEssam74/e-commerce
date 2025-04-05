import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/features/search/ui/widgets/search/search_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/main_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              verticalSpace(10),
              const SearchGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
