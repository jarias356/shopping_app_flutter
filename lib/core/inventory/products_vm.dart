import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/inventory/inventory_repository.dart';
import 'package:shopping_app/core/models/Product.dart';

class ProductsVM extends ChangeNotifier {
  InventoryRepository inventoryRepository = InventoryRepository();

  final List<Product> _lstProducts = [];
  final List<Product> _lstProductsByShop = [];
  int _totalShop = 0;

  List<Product> get lstProducts => _lstProducts;
  List<Product> get lstProductsByShop => _lstProductsByShop;
  int get totalShop => _totalShop;

  void getProducts()  {
    if (_lstProducts.isNotEmpty) return;
    _lstProducts.addAll(inventoryRepository.getProducts());
  }

  void getTotalShop() {
    if (_lstProductsByShop.isEmpty) return;
    var total = 0;
    for (var product in _lstProductsByShop) {
      total += product.total;
    }
    _totalShop = total;
  }

  void getProductsByShop()  {
    if (_lstProductsByShop.isNotEmpty) _lstProductsByShop.clear();
    _lstProductsByShop.addAll(_lstProducts.where((element) => element.quantityByShop > 0));
  }

  void incrementQuantity(int id) {
    _lstProducts.firstWhere((element) => element.id == id).quantityByShop++;
    notifyListeners();
  }

  void resetTotalShop() {
    _totalShop = 0;
  }

  void resetAll() {
    _lstProductsByShop.clear();
    _totalShop = 0;
    for (var product in _lstProducts) {
      product.quantityByShop = 0;
    }
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
    removeProductListByShop(id);
  }

  void removeProductListByShop(int id) {
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