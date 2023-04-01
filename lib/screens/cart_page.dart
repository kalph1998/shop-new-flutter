import 'package:flutter/material.dart';
import 'package:shop/widgets/cart_app_bar.dart';
import 'package:shop/widgets/cart_items.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CartAppBar(),
          Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              
            ),
            child: CartItems(),
          )
        ],
      ),
    );
  }
}
