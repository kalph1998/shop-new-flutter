import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => {Navigator.of(context).popAndPushNamed('/')},
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Cart',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          const Icon(
            Icons.more_vert,
            size: 30,
          )
        ],
      ),
    );
  }
}
