import 'dart:convert';
import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/cart/data/models/get_cart_products_response.dart';
import 'package:ecommerce/features/cart/data/repository/get_cart_products_repository/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GetCartProductsRepoImpl implements GetCartProductsRepo {
  // Get All Product From Cart
  @override
  Future<CartProductsResponse> getCartProducts() async {
    final accessToken = await TokenStorage.getAccessToken();
    final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.cartProducts);
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = await jsonDecode(response.body);
      CartProductsResponse cartProductsResponse = CartProductsResponse.fromJson(json);
      debugPrint('${cartProductsResponse.products?[0].id}');
      debugPrint('${cartProductsResponse.products?[0].product?.id}');
      return cartProductsResponse;
    } else {
      throw UnimplementedError();
    }
  }

  // Delete Product From Cart
  @override
  Future<void> deleteProductFromCart(int productId) async {
    final accessToken = await TokenStorage.getAccessToken();
    final Uri url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.cartProducts}$productId/");
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      debugPrint('Successfully deleted');
      return;
    } else {
      throw Exception(response.body);
    }
  }
}
