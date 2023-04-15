import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_page.dart';
import 'package:shop/screens/home_page.dart';
import 'package:shop/screens/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          '/': (context) => HomePage(),
          CartPage.routeName: (context) => CartPage(),
          ItemPage.routeName: (context) => ItemPage()
        },
      ),
    );
  }
}
