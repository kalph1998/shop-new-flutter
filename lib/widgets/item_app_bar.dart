import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  String productName;
  bool isFavorite;
  String productId;
  ItemAppBar({
    Key? key,
    required this.isFavorite,
    required this.productName,
    required this.productId,
  }) : super(key: key);

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
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              )
            ],
          ),
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 30,
            color: Colors.red,
          )
        ],
      ),
    );
    ;
  }
}
