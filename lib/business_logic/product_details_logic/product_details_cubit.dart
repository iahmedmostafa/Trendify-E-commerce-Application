import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/data/model/add_to_cart_model.dart';
import 'package:trendify/data/model/product_item_model.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductInitial());

  ProductSize? size;
  int quantity = 1;

  void getProductDetails(int index) {
    emit(ProductLoading());
    Future.delayed(Duration(seconds: 1), () {
      final selectedProduct = dummyProducts.firstWhere(
        (item) => item.id == index,
      );
      emit(ProductSuccess(productItemModel: selectedProduct));
    });
  }

   incrementCounter(int productId) {
    quantity++;
    emit(ProductQuantityLoaded(counterValue: quantity));
  }

   decrementCounter(int productId) {
   quantity==1? quantity:quantity--;
    emit(ProductQuantityLoaded(counterValue: quantity));
  }

  void selectSize(ProductSize size) {
    this.size = size;
    emit(SizeSelected(productSize: size));
  }

  addToCart(int productId) {
    emit(AddingToCart());
    final cartItem = AddToCartModel(
      productId: productId,
      quantity: quantity,
      productSize: size!,
      product:dummyProducts.firstWhere((item) => item.id == productId));
    dummyCartProducts.add(cartItem);
    Future.delayed(Duration(seconds: 1), () {
      emit(AddedToCart(productId: productId));
    });
  }
}
