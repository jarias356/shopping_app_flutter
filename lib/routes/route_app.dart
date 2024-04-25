import 'package:go_router/go_router.dart';
import 'package:shopping_app/routes/route_constants.dart';
import 'package:shopping_app/ui/resume_shopping/resume_shopping.dart';
import 'package:shopping_app/ui/shopping_basket/shopping_basket.dart';

import '../ui/inventory/inventory_screen.dart';

GoRouter routeApp = GoRouter(
  routes: [
    GoRoute(
      name: RouteConstants.home,
      path: RouteConstants.home,
      builder: (context, state) {
        return const InventoryScreen();
      },
      routes: [
        GoRoute(
          name: RouteConstants.shoppingBasket,
          path: RouteConstants.shoppingBasket,
          builder: (context, state) {
            return const ShoppingBasket();
          },
        ),
        GoRoute(
          name: RouteConstants.resumeShopping,
          path: RouteConstants.resumeShopping,
          builder: (context, state) {
            return const ResumeShopping();
          },)
      ],
    ),
  ],
);