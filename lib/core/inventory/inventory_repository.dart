import 'dart:math';

import 'package:shopping_app/core/models/Product.dart';

class InventoryRepository {
  double getRandomPrice() {
    var rng = Random();
    return rng.nextDouble() * 100;
  }

  Future<List<Product>> getProducts() async {
    return List<Product>.generate(10, (index) =>
        Product(
          name: 'Product $index',
          price: getRandomPrice(),
          quantityByShop: 0,
        )
    );
  }
}
