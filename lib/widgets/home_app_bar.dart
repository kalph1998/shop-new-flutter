import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: const [
            Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Shop',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
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
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}
