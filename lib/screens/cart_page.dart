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
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(children: [
              const CartItem(),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Text(
                    "Add Coupon Code",
                    style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              )
            ]),
          )
        ],
      ),
    );
  }
}
