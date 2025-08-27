part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductInitial extends ProductDetailsState {}

final class ProductLoading extends ProductDetailsState {}

final class ProductSuccess extends ProductDetailsState {
  final ProductItemModel productItemModel;
  ProductSuccess({required this.productItemModel});
}

final class ProductError extends ProductDetailsState {
  final String errorMsg;
  ProductError({required this.errorMsg});
}

final class ProductQuantityLoaded extends ProductDetailsState{
  final int counterValue;
  ProductQuantityLoaded({required this.counterValue});

}
