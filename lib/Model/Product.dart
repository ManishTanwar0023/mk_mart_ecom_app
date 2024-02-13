

import 'package:mk_mart_ecom_app/Model/product_size_type.dart';

enum ProductType { all, watch, mobile, headphone, tablet, tv }

class Product {
  String name;
  int price;
  int? off;
  String about;
  bool isAvailable;
  ProductSizeType? sizes;
  int quantity;
  List<String> images;
  bool isFavorite;
  double rating;
  ProductType? type;

  // int get quantity => _quantity;
  //
  // set quantity(int newQuantity) {
  //   if (newQuantity >= 0) _quantity = newQuantity;
  // }

  Product({
    required this.name,
    required this.price,
    required this.about,
    required this.isAvailable,
    this.sizes,
    required this.off,
    required  this.quantity,
    required this.images,
    required this.isFavorite,
    required this.rating,
    this.type,
  });

  // factory Product.fromJson(Map<String,dynamic>json){
  //   return Product(name: json['name'], price: json['amount'], about: about, isAvailable: isAvailable, off: off, quantity: quantity, images: images, isFavorite: isFavorite, rating: rating, type: type)
  // }
}
