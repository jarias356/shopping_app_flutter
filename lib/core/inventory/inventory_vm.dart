import 'package:flutter/cupertino.dart';
import 'package:shopping_app/core/inventory/inventory_repository.dart';
import 'package:shopping_app/core/models/Product.dart';

class InventoryVM with ChangeNotifier {
  InventoryRepository inventoryRepository = InventoryRepository();

  final List<Product> _lstProducts = [];

  List<Product> get lstProducts => _lstProducts;

  void getProducts() async {
    _lstProducts.addAll(await inventoryRepository.getProducts());
    notifyListeners();
  }


}