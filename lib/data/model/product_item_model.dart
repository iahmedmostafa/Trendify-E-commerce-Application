class ProductItemModel {
  final int id;
  final String name;
  final String imgUrl;
  final String category;
  final double price;
  final String desc;
  final bool isFavourite;
  final String review;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.category,
    required this.price,
    this.desc = "Upgrade your wardrobe with this stylish and versatile piece, designed to bring together comfort, quality, and modern fashion. Crafted from premium, breathable fabric, it ensures all-day comfort whether you're at work, out with friends, or relaxing at home. The sleek design and attention to detail make it suitable for both casual outings and special occasions",
    this.isFavourite = false,
    this.review="4.5"
  });
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: 1,
    name: 'T-shirt',
    imgUrl: 'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    price: 10,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 2,
    name: 'Black Shoes',
    imgUrl: 'https://pngimg.com/d/men_shoes_PNG7475.png',
    price: 20,
    category: 'Shoes',
  ),
  ProductItemModel(
    id: 3,
    name: 'Trousers',
    imgUrl: 'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
    price: 30,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 4,
    name: 'Pack of Tomatoes',
    imgUrl: 'https://parspng.com/wp-content/uploads/2022/12/tomatopng.parspng.com-6.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: 5,
    name: 'Pack of Potatoes',
    imgUrl: 'https://pngimg.com/d/potato_png2398.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: 6,
    name: 'Pack of Onions',
    imgUrl: 'https://pngimg.com/d/onion_PNG99213.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: 7,
    name: 'Pack of Apples',
    imgUrl: 'https://pngfre.com/wp-content/uploads/apple-43-1024x1015.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 8,
    name: 'Pack of Oranges',
    imgUrl: 'https://parspng.com/wp-content/uploads/2022/05/orangepng.parspng.com_-1.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 9,
    name: 'Pack of Bananas',
    imgUrl: 'https://static.vecteezy.com/system/resources/previews/015/100/096/original/bananas-transparent-background-free-png.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 10,
    name: 'Pack of Mangoes',
    imgUrl: 'https://purepng.com/public/uploads/large/mango-tgy.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 11,
    name: 'Sweet Shirt',
    imgUrl: 'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    price: 15,
    category: 'Clothes',
  ),
];