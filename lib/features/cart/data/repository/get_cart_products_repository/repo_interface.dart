import 'package:ecommerce/features/cart/data/models/get_cart_products_response.dart';

abstract class GetCartProductsRepo {
  Future<CartProductsResponse> getCartProducts();
  Future<void> deleteProductFromCart (int productId);
}