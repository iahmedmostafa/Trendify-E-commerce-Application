import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/data/model/product_item_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

   getProductDetails(int index){
    emit(ProductLoading());
    Future.delayed(Duration(seconds: 1),(){
      final selectedProduct= dummyProducts.firstWhere((item)=>item.id==index);
      emit(ProductSuccess(productItemModel: selectedProduct));
    });

  }


}
