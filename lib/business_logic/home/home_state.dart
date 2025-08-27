part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
 final List<ProductItemModel> products;
 final List<HomeCarouselModel> carousel;

  HomeLoaded({required this.products, required this.carousel});

}

final class HomeError extends HomeState {
  final String errorMsg;

  HomeError({required this.errorMsg});


}
