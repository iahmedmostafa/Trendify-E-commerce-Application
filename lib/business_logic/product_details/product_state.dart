part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final ProductItemModel productItemModel;
  ProductSuccess({required this.productItemModel});
}

final class ProductError extends ProductState {
  final String errorMsg;
  ProductError({required this.errorMsg});
}
