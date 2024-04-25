import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/routes/route_app.dart';

import 'core/inventory/inventory_vm.dart';

void main() {
  runApp(ChangeNotifierProvider<InventoryVM>(
      create: (BuildContext context) => InventoryVM(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routeApp,
    );
  }
}
