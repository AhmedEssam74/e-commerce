import 'dart:convert';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/search/data/models/search_response_model.dart';
import 'package:ecommerce/features/search/data/repository/repo_interface.dart';
import 'package:http/http.dart' as http;

class SearchProductRepoImpl implements SearchProductRepo {
  @override
  Future<SearchResponse> searchProduct({
    String? productName,
    int? minPrice,
    int? maxPrice,
    String? subCategory,
    String? category,
    int? pageSize,
  }) async {
    final queryParams = <String, String>{};

    if (productName != null && productName.isNotEmpty) {
      queryParams['product_name'] = productName;
    }
    if (minPrice != null) {
      queryParams['min_price'] = minPrice.toString();
    }
    if (maxPrice != null) {
      queryParams['max_price'] = maxPrice.toString();
    }
    if (subCategory != null && subCategory.isNotEmpty) {
      queryParams['sub_category'] = subCategory;
    }
    if (category != null && category.isNotEmpty) {
      queryParams['category'] = category;
    }
    if (pageSize != null) {
      queryParams['page_size'] = pageSize.toString();
    }
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.searchProduct)
        .replace(queryParameters: queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      SearchResponse searchResponse = SearchResponse.fromJson(json);
      return searchResponse;
    } else {
      throw UnimplementedError();
    }
  }
}
