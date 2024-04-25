import 'dart:math';

import 'package:shopping_app/core/models/Product.dart';

class InventoryRepository {
  int getRandomPrice() {
    var rng = Random();
    int min = 1;
    int max = 500;
    return rng.nextInt(max - min) + min;
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
