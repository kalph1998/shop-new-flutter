import 'package:flutter/material.dart';
import 'package:shop/widgets/home_app_bar.dart';

import '../widgets/Items_widget.dart';
import '../widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                ItemsWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
