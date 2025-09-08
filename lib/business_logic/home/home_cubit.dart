import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trendify/data/model/category_item_model.dart';
import 'package:trendify/data/model/home_carousel_model.dart';
import 'package:trendify/data/model/product_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Timer? _timer;

  void getHomeData() {
    emit(HomeLoading());
    _timer = Timer(const Duration(seconds: 2), () {
      if (!isClosed) {
        emit(
          HomeLoaded(products: dummyProducts, carousel: dummyHomeCarouselItems),
        );
      }
    });
  }
}
