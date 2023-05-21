import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Sandal',
      description: 'A beautiful sandal ',
      price: 29.99,
      imageUrl: 'images/1.png',
    ),
    Product(
      id: 'p2',
      title: 'Black bag',
      description: 'A nice black bag',
      price: 59.99,
      imageUrl: 'images/3.png',
    ),
    Product(
      id: 'p3',
      title: 'Black sandal',
      description: 'Beautiful Sandal for Beautiful occasions',
      price: 19.99,
      imageUrl: 'images/6.png',
    ),
    Product(
      id: 'p4',
      title: 'Leather watch',
      description: 'Leather watch for formal occasions',
      price: 49.99,
      imageUrl: 'images/7.png',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get getFavoriteItems {
    return _items.where((element) => element.isFavorite == true).toList();
  }

  // List<Product> get items {
  //   if (showFavoritesOnly) {
  //     return _items.where((element) => element.isFavorite == true).toList();
  //   } else {
  //     return [..._items];
  //   }
  // }

  // void showFavorites() {
  //   showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void hideFavorites() {
  //   showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value)
    notifyListeners();
  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
