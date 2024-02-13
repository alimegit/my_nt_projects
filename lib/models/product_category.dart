class ProductModel {
  final String productName;
  final String productPrice;
  final String image;
  final ProductCategory category;

  ProductModel({
    required this.category,
    required this.productName,
    required this.image,
    required this.productPrice,
  });
}

enum ProductCategory {
  all,
  Computers,
  Accesories,
  Smartphones,
  Smartobjects,
  Speakers,
  Shops,
  Magazin,

}
