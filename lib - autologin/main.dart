import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './providers/auth.dart';

import './pages/home_page.dart';
import './pages/auth_page.dart';
import './pages/add_product_page.dart';
import './pages/edit_product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(),
          update: (context, auth, products) =>
              products..updateData(auth.token, auth.userId),
        ),
      ],
      builder: (context, child) => Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? HomePage() : LoginPage(),
          routes: {
            AddProductPage.route: (ctx) => AddProductPage(),
            EditProductPage.route: (ctx) => EditProductPage(),
          },
        ),
      ),
    );
  }
}
