import 'dart:ffi';

class Product {
  final String name;
  final double price;
  double quantityByShop;

  double get total => price * quantityByShop;

  Product({
    required this.name,
    required this.price,
    required this.quantityByShop,
  });

}