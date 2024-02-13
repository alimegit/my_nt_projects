import 'package:flutter_nt_ten/models/product_category.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';

List<ProductModel> products = [
  ProductModel(
      category: ProductCategory.Accesories,
      productName: "Accesor",
      image: AppImages.accesor,
      productPrice: "\$200"),
  ProductModel(
      category: ProductCategory.Smartphones,
      productName: "Smartphone",
      image: AppImages.smartphone,
      productPrice: "\$200"),
  ProductModel(
      category: ProductCategory.Computers,
      productName: "Computers",
      image: AppImages.computers,
      productPrice: "\$200"),
  ProductModel(
      category: ProductCategory.Speakers,
      productName: "Speakers",
      image: AppImages.speaker,
      productPrice: "\$200"),
  ProductModel(
      category: ProductCategory.Magazin,
      productName: "Speakers",
      image: "",
      productPrice: "\$200"),
  ProductModel(
      category: ProductCategory.Shops,
      productName: "Speakers",
      image: "",
      productPrice: "\$200"),
];
