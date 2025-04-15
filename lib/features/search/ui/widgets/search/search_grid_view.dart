import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/widgets/app_error_dialog.dart';
import 'package:ecommerce/features/search/cubit/search_item_cubit.dart';
import 'package:ecommerce/features/search/cubit/search_item_states.dart';
import 'package:ecommerce/features/search/data/repository/repo_implementation.dart';
import 'package:ecommerce/features/search/ui/widgets/search/empty_search_widget.dart';
import 'package:ecommerce/features/search/ui/widgets/search/search_field.dart';
import 'package:ecommerce/features/search/ui/widgets/search/search_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchProductCubit(SearchProductRepoImpl()),
      child: const _SearchGridContent(),
    );
  }
}

class _SearchGridContent extends StatefulWidget {
  const _SearchGridContent();

  @override
  State<_SearchGridContent> createState() => _SearchGridContentState();
}

class _SearchGridContentState extends State<_SearchGridContent> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.clear();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchProductCubit>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(
            controller: searchController,
            onChange: (String value) {
              if (value.isNotEmpty) {
                bloc.searchProduct(productName: value);
              } else {
                bloc.searchProduct(productName: "k");
              }
            },
          ),
          verticalSpace(20),
          BlocConsumer<SearchProductCubit, SearchProductStates>(
            listener: (context, state) {
              if (state is SearchProductErrorState) {
                AppErrorDialog.showErrorDialog(
                  context,
                  // message: "something went wrong please try again.",
                  message: state.error,
                  onConfirm: (){
                    context.pop();
                  }
                );
              }
            },
            builder: (context, state) {
              var allProducts = bloc.searchResponse?.products ?? [];
              debugPrint('${allProducts.length}');
              return Visibility(
                visible: allProducts.isEmpty ? true : false,
                replacement: Expanded(
                  child: SingleChildScrollView(
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.productDetailsScreen);
                          },
                          child: SearchProductItem(
                            products: allProducts[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                child: const EmptySearchWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
