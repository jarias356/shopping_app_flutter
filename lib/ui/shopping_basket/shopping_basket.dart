import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/ui/shared/shared_widgets.dart';

import '../../core/inventory/products_vm.dart';
import '../../routes/route_constants.dart';
import '../shared/models/app_bar_model.dart';
import '../theme/TextStyles.dart';

class ShoppingBasket extends StatelessWidget {
  const ShoppingBasket({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsVM>(context, listen: false).getProductsByShop();
    Provider.of<ProductsVM>(context, listen: false).resetTotalShop();

    final AppBarModel appBarModel = AppBarModel(
        title: "Shopping Basket",
        context: context,
        iconDataLeading: Icons.arrow_back_ios_new_sharp,
        onPressedLeading: () { context.goNamed(RouteConstants.home); }
    );
    return Scaffold(
      appBar: SharedWidgets.buildAppBarTitleCenter(appBarModel),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ListView.builder(
                  itemCount: Provider.of<ProductsVM>(context).lstProductsByShop.length,
                  itemBuilder: (context, index) {
                    var product = Provider.of<ProductsVM>(context).lstProductsByShop[index];
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
                                  const SizedBox(width: 16),
                                  Text(product.quantityByShop.toString()),
                                  const SizedBox(width: 16),
                                  TextButton(
                                      onPressed: () { Provider.of<ProductsVM>(context, listen: false).deleteFromShoppingBasket(product.id); },
                                      child: const Icon(Icons.delete)),
                                  const SizedBox(width: 16),
                                  Text("\$ ${product.total}"),
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
                  context.goNamed(RouteConstants.resumeShopping);
                },
                child: const Text("Go to Resume Shopping")),
          )

        ],
      ),
    );
  }
}
