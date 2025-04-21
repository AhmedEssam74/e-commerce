import 'package:ecommerce/features/search/data/models/search_response_model.dart';

abstract class SearchProductRepo {
  Future<SearchResponse> searchProduct({
    String? productName,
    int? minPrice,
    int? maxPrice,
    String? subCategory,
    String? category,
    int? pageSize,
  });
}
