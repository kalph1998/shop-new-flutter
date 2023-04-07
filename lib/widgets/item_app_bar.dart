import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({Key? key}) : super(key: key);

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
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xFF4C53A5),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Product',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              )
            ],
          ),
          const Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.red,
          )
        ],
      ),
    );
    ;
  }
}
