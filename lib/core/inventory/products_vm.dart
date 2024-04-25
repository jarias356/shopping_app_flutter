import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/inventory/inventory_repository.dart';
import 'package:shopping_app/core/models/Product.dart';

class ProductsVM extends ChangeNotifier {
  InventoryRepository inventoryRepository = InventoryRepository();

  final List<Product> _lstProducts = [];
  final List<Product> _lstProductsByShop = [];

  List<Product> get lstProducts => _lstProducts;
  List<Product> get lstProductsByShop => _lstProductsByShop;

  void getProducts() async {
    if (_lstProducts.isNotEmpty) return;
    _lstProducts.addAll(await inventoryRepository.getProducts());
    notifyListeners();
  }

  void getProductsByShop()  {
    if (_lstProductsByShop.isNotEmpty) return;
    _lstProductsByShop.clear();
    _lstProductsByShop.addAll(_lstProducts.where((element) => element.quantityByShop > 0));
  }

  void incrementQuantity(int id) {
    _lstProducts.firstWhere((element) => element.id == id).quantityByShop++;
    notifyListeners();
  }

  void decrementQuantity(int id) {
    var product = _lstProducts.firstWhere((element) => element.id == id);
    if (product.quantityByShop > 0) {
      product.quantityByShop--;
    }
    notifyListeners();
  }

  void deleteFromShoppingBasket(int id) {
    resetQuantity(id);
    updateListByShop(id);
  }

  void updateListByShop(int id) {
    _lstProductsByShop.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void resetQuantity(int id) {
    Product product = _lstProducts.firstWhere((element) => element.id == id);
    if (product.quantityByShop > 0) {
      product.quantityByShop = 0;
    }
    notifyListeners();
  }


}