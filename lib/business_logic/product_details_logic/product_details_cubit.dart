import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/data/model/product_item_model.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductInitial());

   getProductDetails(int index){
    emit(ProductLoading());
    Future.delayed(Duration(seconds: 1),(){
      final selectedProduct= dummyProducts.firstWhere((item)=>item.id==index);
      emit(ProductSuccess(productItemModel: selectedProduct));
    });
  }

 void incrementCounter(int productId){
     final selectedIndex=dummyProducts.indexWhere((item)=>item.id==productId);
     dummyProducts[selectedIndex]=dummyProducts[selectedIndex].copyWith(
       quantity: dummyProducts[selectedIndex].quantity+1,
     );
     emit(ProductQuantityLoaded(counterValue:  dummyProducts[selectedIndex].quantity));
  }
 void  decrementCounter(int productId){
    final selectedIndex=dummyProducts.indexWhere((item)=>item.id==productId);
    dummyProducts[selectedIndex]=dummyProducts[selectedIndex].copyWith(
      quantity:dummyProducts[selectedIndex].quantity==1?dummyProducts[selectedIndex].quantity: dummyProducts[selectedIndex].quantity-1,
    );
    emit(ProductQuantityLoaded(counterValue:  dummyProducts[selectedIndex].quantity));
  }

  void selectSize(ProductSize size){
     emit(SizeSelected(productSize: size));
  }





}
