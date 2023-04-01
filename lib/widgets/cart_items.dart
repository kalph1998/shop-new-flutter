import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          child: Container(
            height: 110,
          ),
        )
      ],
    );
  }
}
