import 'package:flutter/material.dart';
import 'package:shop/widgets/item_app_bar.dart';

class ItemPage extends StatelessWidget {
  static const routeName = "itemPage";
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [ItemAppBar()],
      ),
    );
  }
}
