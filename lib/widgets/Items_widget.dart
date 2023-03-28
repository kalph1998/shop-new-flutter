import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      children: [Item(), Item(), Item()],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

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
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Image.asset("images/1.png"),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Product Title",
              style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.shopping_cart_checkout)
            ],
          ),
        ],
      ),
    );
  }
}
