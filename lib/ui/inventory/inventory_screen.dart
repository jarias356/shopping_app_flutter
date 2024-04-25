 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/inventory/inventory_vm.dart';
import 'package:shopping_app/routes/route_constants.dart';
import 'package:shopping_app/ui/shared/models/app_bar_model.dart';
import 'package:shopping_app/ui/shared/shared_widgets.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppBarModel appBarModel = AppBarModel(
        title: "Inventory",
        context: context
    );
    InventoryVM inventoryVM = Provider.of<InventoryVM>(context);
    return Scaffold(
      appBar: SharedWidgets.buildAppBarTitleCenter(appBarModel),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ListView.builder(
                    itemCount: inventoryVM.lstProducts.length,
                    itemBuilder: (context, index) {
                      var product = inventoryVM.lstProducts[index];
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Card(
                          child: Row(
                            children: [
                              Column(

                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline)
                              )
                            ],
                          ),
                        ),
                      )
                    }
                ),
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
