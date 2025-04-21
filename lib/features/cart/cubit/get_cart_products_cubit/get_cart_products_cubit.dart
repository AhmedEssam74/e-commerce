import 'package:ecommerce/features/cart/cubit/get_cart_products_cubit/get_cart_products_states.dart';
import 'package:ecommerce/features/cart/data/models/get_cart_products_response.dart';
import 'package:ecommerce/features/cart/data/repository/get_cart_products_repository/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartProductsCubit extends Cubit<GetCartProductsStates> {
  CartProductsResponse? cartProductsResponse;
  GetCartProductsRepo repo;

  GetCartProductsCubit(this.repo) : super(InitGetCartProductsState());

  // Get All Product From Cart
  void getCartProducts() async {
    try {
      emit(GetCartProductLoadingsState());
      cartProductsResponse = await repo.getCartProducts();
      emit(GetCartProductsSuccessState());
    } catch (e) {
      emit(GetCartProductsErrorState('$e'));
      debugPrint('$e');
    }
  }

  // Delete Product From Cart
  void deleteProductFromCart(int productId) async {
    try {
      emit(DeleteCartProductLoadingsState());
      await repo.deleteProductFromCart(productId);
      emit(DeleteCartProductsSuccessState());
    } catch (e) {
      emit(DeleteCartProductsErrorState(e.toString()));
      debugPrint('$e');
    }
  }
}
