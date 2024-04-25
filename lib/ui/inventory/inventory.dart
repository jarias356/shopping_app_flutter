import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/inventory/products_vm.dart';
import 'package:shopping_app/routes/route_constants.dart';
import 'package:shopping_app/ui/shared/models/app_bar_model.dart';
import 'package:shopping_app/ui/shared/shared_widgets.dart';
import 'package:shopping_app/ui/theme/TextStyles.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    final AppBarModel appBarModel =
        AppBarModel(title: "Inventory", context: context);
    Provider.of<ProductsVM>(context).getProducts();
    Provider.of<ProductsVM>(context).resetTotalShop();
    return Scaffold(
      appBar: SharedWidgets.buildAppBarTitleCenter(appBarModel),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount:
                        Provider.of<ProductsVM>(context).lstProducts.length,
                    itemBuilder: (context, index) {
                      var product =
                          Provider.of<ProductsVM>(context).lstProducts[index];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text(product.name, style: TextsStyles.title),
                              Text("\$ ${product.price}"),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FilledButton(
                                      onPressed: () { Provider.of<ProductsVM>(context, listen: false).decrementQuantity(product.id); },
                                      child: const Icon(Icons.arrow_back_ios_new_sharp)),
                                  const SizedBox(width: 16),
                                  Text(product.quantityByShop.toString()),
                                  const SizedBox(width: 16),
                                  FilledButton(
                                      onPressed: () {
                                        Provider.of<ProductsVM>(context, listen: false).incrementQuantity(product.id);
                                      },
                                      child: const Center(
                                          child: Icon(Icons.arrow_forward_ios_rounded)
                                      ),

                                  ),
                                  const SizedBox(width: 16),
                                  TextButton(
                                      onPressed: () { Provider.of<ProductsVM>(context, listen: false).resetQuantity(product.id); },
                                      child: const Icon(Icons.delete)),
                                ]
                              ),
                              const SizedBox(height: 16)
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 20),
              child: FilledButton(
                  onPressed: () {
                    context.goNamed(RouteConstants.shoppingBasket);
                  },
                  child: const Text("Go to Shopping Basket")),
            )
          ],
        ),
      ),
    );
  }
}
