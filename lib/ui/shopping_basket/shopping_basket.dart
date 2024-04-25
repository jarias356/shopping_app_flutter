import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/ui/shared/shared_widgets.dart';

import '../../routes/route_constants.dart';
import '../shared/models/app_bar_model.dart';

class ShoppingBasket extends StatelessWidget {
  const ShoppingBasket({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                  color: Colors.blueGrey
              ),
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
