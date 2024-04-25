import 'package:flutter/cupertino.dart';
import 'package:shopping_app/core/inventory/inventory_repository.dart';
import 'package:shopping_app/core/models/Product.dart';

class InventoryVM extends ChangeNotifier {
  InventoryRepository inventoryRepository = InventoryRepository();

  final List<Product> _lstProducts = [];

  List<Product> get lstProducts => _lstProducts;

  void getProducts() async {
    _lstProducts.addAll(await inventoryRepository.getProducts());
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _lstProducts[index].quantityByShop++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    Product product = _lstProducts[index];
    if (product.quantityByShop > 0) {
      product.quantityByShop--;
    }
    notifyListeners();
  }

  void resetQuantity(int index) {
    Product product = _lstProducts[index];
    if (product.quantityByShop > 0) {
      product.quantityByShop = 0;
    }
    notifyListeners();
  }


}