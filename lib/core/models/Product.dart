class Product {
  final int id;
  final String name;
  final int price;
  int quantityByShop = 0;

  int get total => price * quantityByShop;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantityByShop,
  });

}