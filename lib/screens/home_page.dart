import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_page.dart';
import 'package:shop/widgets/home_app_bar.dart';

import '../widgets/products_widget.dart';
import '../widgets/search.dart';

enum FilterOptions { favorites, all }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeAppBar(),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SearchBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        'Best selling',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Consumer<Products>(
                      builder: (context, value, child) => PopupMenuButton(
                          onSelected: (FilterOptions val) {
                            setState(() {
                              if (val == FilterOptions.favorites) {
                                _showOnlyFavorites = true;
                              } else {
                                _showOnlyFavorites = false;
                              }
                            });
                          },
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (_) => const [
                                PopupMenuItem(
                                  value: FilterOptions.all,
                                  child: Text('Show All'),
                                ),
                                PopupMenuItem(
                                  value: FilterOptions.favorites,
                                  child: Text('Only Favorites'),
                                ),
                              ]),
                    )
                  ],
                ),
                Container(
                    height: 700,
                    child: ProductsWidget(
                      isFavoriteSelected: _showOnlyFavorites,
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color(0xFF4C53A5),
        height: 50,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).pushNamed(CartPage.routeName);
          }
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
