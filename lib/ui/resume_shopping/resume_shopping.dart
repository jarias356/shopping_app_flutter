import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/inventory/products_vm.dart';
import 'package:shopping_app/routes/route_constants.dart';
import 'package:shopping_app/ui/theme/TextStyles.dart';

import '../shared/models/app_bar_model.dart';
import '../shared/shared_widgets.dart';

class ResumeShopping extends StatelessWidget {
  const ResumeShopping({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsVM>(context).getTotalShop();

    final AppBarModel appBarModel = AppBarModel(
        title: "Resume",
        context: context,
        iconDataLeading: Icons.arrow_back_ios_new_sharp,
        onPressedLeading: () { context.goNamed(RouteConstants.shoppingBasket); }
    );
    return Scaffold(
      appBar: SharedWidgets.buildAppBarTitleCenter(appBarModel),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total to Pay", style: TextsStyles.title),
                    Text("\$ ${Provider.of<ProductsVM>(context).totalShop}", style: TextsStyles.importantText)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 20),
            child: Column(
              children: [
                FilledButton(
                    onPressed: () {
                      context.goNamed(RouteConstants.home);
                    },
                    child: const Text("Continue Shopping")
                ),
                const SizedBox(height: 32),
                FilledButton(
                    onPressed: () {
                      Provider.of<ProductsVM>(context, listen: false).resetAll();
                      context.goNamed(RouteConstants.home);
                    },
                    child: const Text("Finish Shopping")
                ),
              ],
            ),

          )
        ],
      ),
    );
  }

}