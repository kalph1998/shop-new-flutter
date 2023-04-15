import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shop/screens/cart_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.sort,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Shop',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          badges.Badge(
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red, padding: EdgeInsets.all(6)),
            child: InkWell(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(CartPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
