abstract class GetCartProductsStates {}

class InitGetCartProductsState extends GetCartProductsStates {}

class GetCartProductLoadingsState extends GetCartProductsStates {}

class GetCartProductsSuccessState extends GetCartProductsStates {}

class GetCartProductsErrorState extends GetCartProductsStates {
  String error;

  GetCartProductsErrorState(this.error);
}
// class InitDeleteCartProductsState extends GetCartProductsStates {}

class DeleteCartProductLoadingsState extends GetCartProductsStates {}

class DeleteCartProductsSuccessState extends GetCartProductsStates {}

class DeleteCartProductsErrorState extends GetCartProductsStates {
  String error;

  DeleteCartProductsErrorState(this.error);
}
