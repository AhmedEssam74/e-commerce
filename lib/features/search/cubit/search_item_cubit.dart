import 'package:ecommerce/features/search/cubit/search_item_states.dart';
import 'package:ecommerce/features/search/data/models/search_response_model.dart';
import 'package:ecommerce/features/search/data/repository/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductCubit extends Cubit<SearchProductStates> {
  SearchResponse? searchResponse;
  SearchProductRepo repo;

  SearchProductCubit(this.repo) : super(InitSearchProductState());

  void searchProduct({
    String? productName,
    int? minPrice,
    int? maxPrice,
    String? subCategory,
    String? category,
    int? pageSize,
  }) async {
    try {
      emit(SearchProductLoadingState());
      searchResponse = await repo.searchProduct(
        productName: productName,
        category: category,
        subCategory: subCategory,
        minPrice: minPrice,
        maxPrice: maxPrice,
        pageSize: pageSize,
      );
      if (searchResponse!.products!.isEmpty){
        emit(SearchProductEmptyState());
      }else {
        emit(SearchProductSuccessState());
      }
    } catch (e) {
      emit(SearchProductErrorState('$e'));
      debugPrint('$e');
    }
  }
}
