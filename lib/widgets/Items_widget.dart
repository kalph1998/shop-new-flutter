import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop/screens/item_page.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.58,
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      physics: NeverScrollableScrollPhysics(),
      children: [
        for (int i = 1; i < 8; i++)
          Item(
            index: i,
          )
      ],
    );
  }
}

class Item extends StatelessWidget {
  final int index;

  const Item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF4C53A5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    '-50%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => {Navigator.of(context).pushNamed(ItemPage.routeName)},
            child: Image.asset(
              "images/$index.png",
              width: 120,
              height: 120,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Product Title",
              style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Write description of product",
              style: TextStyle(color: Color(0xFF4C53A5)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '\$55',
                style: TextStyle(
                    color: Color(0xFF4C53A5),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.shopping_cart_checkout,
                color: Color(0xFF4C53A5),
              )
            ],
          ),
        ],
      ),
    );
  }
}
