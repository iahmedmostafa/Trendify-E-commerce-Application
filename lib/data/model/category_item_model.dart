class CategoryItemModel {
  final int id;
  final String categoryName;
  final String imgUrl;
  final int categoryItemsCount;

  CategoryItemModel({
    required this.id,
    required this.categoryName,
    required this.imgUrl,
    required this.categoryItemsCount,
  });
}

List<CategoryItemModel> dummyCategories = [
  CategoryItemModel(
    id: 0,
    categoryName: "NewArrivals",
    imgUrl:
        "https://images.ctfassets.net/tbo073lbm8np/XduhFmgDampqc7SV4jePM/da0ce956d5084eb332691bd3a1d202c9/shutterstock_1309748491.jpg?fm=webp&w=530&q=75",
    categoryItemsCount: 74,
  ),
  CategoryItemModel(
    id: 1,
    categoryName: "Clothes",
    imgUrl:
        "https://media.istockphoto.com/id/1392944438/photo/portrait-of-handsome-attractive-positive-curly-haired-indian-or-arabian-guy-wearing-white.jpg?s=612x612&w=0&k=20&c=i2PJ9QFenv2dCaORkN5AYuiLz3UYzMiqNXeAgqumsxY=",
    categoryItemsCount: 210,
  ),
  CategoryItemModel(
    id: 2,
    categoryName: "Bags",
    imgUrl:
        "https://static.vecteezy.com/system/resources/thumbnails/006/169/681/small_2x/a-black-leather-bag-on-an-orange-background-photo.jpg",
    categoryItemsCount: 165,
  ),
  CategoryItemModel(
    id: 5,
    categoryName: "Electronics",
    imgUrl:
    "https://plus.unsplash.com/premium_photo-1679513691474-73102089c117?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D",
    categoryItemsCount: 20,
  ),
  CategoryItemModel(
    id: 6,
    categoryName: "Accessories",
    imgUrl:
    "https://upload.3dlat.com/uploads/3dlat.com_14068396071.jpg",
    categoryItemsCount: 101,
  ),
  CategoryItemModel(
    id: 3,
    categoryName: "Shoes",
    imgUrl:
        "https://cdn.pixabay.com/photo/2020/10/11/05/36/nike-5644799_1280.jpg",
    categoryItemsCount: 442,
  ),


];
