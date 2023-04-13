import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/item_page.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> loadedProducts = Provider.of<Products>(context).items;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.56,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return Item(item: loadedProducts[index]);
      },
    );
  }
}

class Item extends StatelessWidget {
  final Product item;

  const Item({super.key, required this.item});

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
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(ItemPage.routeName, arguments: item.id)
            },
            child: Image.network(
              item.imageUrl,
              width: 120,
              height: 120,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7),
            alignment: Alignment.centerLeft,
            child: Text(
              item.title,
              style: const TextStyle(
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item.description,
              style: const TextStyle(color: Color(0xFF4C53A5)),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${item.price}',
                style: const TextStyle(
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
