 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return Scaffold(
      appBar: SharedWidgets.buildAppBarTitleCenter(appBarModel),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  color: Colors.blueGrey
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
