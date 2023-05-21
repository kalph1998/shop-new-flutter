import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_page.dart';
import 'package:shop/screens/item_page.dart';

class ProductsWidget extends StatelessWidget {
  final bool isFavoriteSelected;

  const ProductsWidget({super.key, required this.isFavoriteSelected});

  @override
  Widget build(BuildContext context) {
    final List<Product> loadedProducts = isFavoriteSelected
        ? Provider.of<Products>(context).getFavoriteItems
        : Provider.of<Products>(context).items;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.50,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          builder: (context, child) => Item(),
        );
      },
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Product item = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

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
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
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
                Consumer<Product>(
                    builder: (ctx, product, child) => InkWell(
                          onTap: () {
                            product.toggleFavoriteStatus();
                          },
                          child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ))
              ],
            ),
          ),
          InkWell(
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(ItemPage.routeName, arguments: item.id)
            },
            child: Image.asset(
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
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item.description,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${item.price}',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  cart.addItem(item.id, item.price, item.title, item.imageUrl);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Product added to cart'),
                    action: SnackBarAction(
                        label: 'Go to cart',
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartPage.routeName);
                        }),
                  ));
                },
                child: Icon(
                  Icons.shopping_cart_checkout,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
