import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/routes/route_constants.dart';

import '../shared/models/app_bar_model.dart';
import '../shared/shared_widgets.dart';

class ResumeShopping extends StatelessWidget {
  const ResumeShopping({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                  color: Colors.blueGrey
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