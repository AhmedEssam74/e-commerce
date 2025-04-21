import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/widgets/app_error_dialog.dart';
import 'package:ecommerce/core/widgets/app_loader.dart';
import 'package:ecommerce/core/widgets/app_toast_message.dart';
import 'package:ecommerce/features/cart/cubit/get_cart_products_cubit/get_cart_products_cubit.dart';
import 'package:ecommerce/features/cart/cubit/get_cart_products_cubit/get_cart_products_states.dart';
import 'package:ecommerce/features/cart/data/repository/get_cart_products_repository/repo_implementation.dart';
import 'package:ecommerce/features/cart/ui/widgets/cart/empty_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) =>
            GetCartProductsCubit(GetCartProductsRepoImpl())..getCartProducts(),
        child: BlocConsumer<GetCartProductsCubit, GetCartProductsStates>(
          listener: (context, state) {
            if (state is GetCartProductLoadingsState) {
              // AppLoader.show(context);
            } else if (state is GetCartProductsErrorState) {
              AppErrorDialog.showErrorDialog(
                context,
                message: state.error,
              );
            } else if (state is GetCartProductsSuccessState) {
              // AppToast.showSuccess("Product Deleted Successfully");
            } else if (state is DeleteCartProductLoadingsState) {
              AppLoader.show(context);
            } else if (state is DeleteCartProductsErrorState) {
              AppErrorDialog.showErrorDialog(
                context,
                message: state.error,
              );
            } else if (state is DeleteCartProductsSuccessState) {
              context.pop();
              // context.pop();
              AppToast.showSuccess("Deleted successfully");
              // context.pushNamed(Routes.mainNavigationBar);
            }
          },
          builder: (context, state) {
            var bloc = BlocProvider.of<GetCartProductsCubit>(context);
            var cartProducts = bloc.cartProductsResponse?.products ?? [];
            return Visibility(
              visible: cartProducts.isEmpty ? false : true,
              replacement: const EmptyCartWidget(),
              child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) => CartItem(
                  image: cartProducts[index].product?.images?[0].img ?? "",
                  category: cartProducts[index].product?.name ?? "",
                  // productName: 'Blush Luxe Chair',
                  description: cartProducts[index].product?.description ?? "",
                  price: cartProducts[index].product?.price ?? "",
                  quantity: cartProducts[index].product?.quantity ?? 0,
                  onIncrementTap: () {},
                  onDecrementTap: () {},
                  onDismissed: () {
                    bloc.getCartProducts();
                    bloc.deleteProductFromCart(cartProducts[index].id ?? 0);
                    bloc.getCartProducts();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
