part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<AddToCartModel> cartItems;
  final double subTotal;
  CartLoaded({required this.cartItems,required this.subTotal});
}

final class CartError extends CartState {
  final String errorMsg;
  CartError({required this.errorMsg});
}

final class ProductCartQuantityLoaded extends CartState {
  final int counterValue;
  final int productId;
  ProductCartQuantityLoaded({required this.counterValue,required this.productId});
}
