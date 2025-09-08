import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/data/model/add_to_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  int quantity=0;
  CartCubit() : super(CartInitial());
Timer? _timer;

   getCartItems(){
    emit(CartLoading());
    final subTotal=dummyCartProducts.fold<double>(0, (previousValue,item)=>
    previousValue+(item.product.price*item.quantity));
    _timer=Timer(const Duration(seconds: 1),(){
      if(!isClosed){
        emit(CartLoaded(cartItems: dummyCartProducts,subTotal:subTotal ));
      }
    } );

  }
  void incrementCounter(int productId,[int? initialValue]) {
     if(initialValue!=null){
       quantity=initialValue;
     }
    quantity++;
    emit(ProductCartQuantityLoaded(counterValue: quantity,productId: productId));
  }

  void decrementCounter(int productId,[int? initialValue]) {
    if(initialValue!=null){
      quantity=initialValue;
    }
    quantity==1? quantity: quantity--;
    emit(ProductCartQuantityLoaded(counterValue: quantity,productId: productId));
  }

}
