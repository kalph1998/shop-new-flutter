import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';

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
    final Product item = Provider.of<Product>(context);
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
                productName,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              item.toggleFavoriteStatus();
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 30,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
    ;
  }
}
