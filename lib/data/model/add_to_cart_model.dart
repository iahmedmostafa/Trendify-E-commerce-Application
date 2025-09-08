import 'package:trendify/data/model/product_item_model.dart';

class AddToCartModel {
  final int productId;
  final int quantity;
  final ProductItemModel product;
  final ProductSize productSize;

  AddToCartModel({
    required this.productId,
    required this.quantity,
    required this.product,
    required this.productSize,
  });

  double get productTotalPrice=> product.price*quantity;

  AddToCartModel copyWith({
    int? productId,
    int? quantity,
    ProductSize? productSize,
    ProductItemModel? product,
  }) {
    return AddToCartModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      productSize: productSize ?? this.productSize,
      product: product ?? this.product,
    );
  }
}

List<AddToCartModel> dummyCartProducts = [];
