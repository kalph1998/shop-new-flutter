import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get cartItems {
    return {..._items};
  }

  int get cartItemCount {
    return cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(String productId, double price, String title, String imageUrl,
      {int productQuantity = 1}) {
    if (_items.containsKey(productId)) {
      // added to existing product
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: productQuantity,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    _items.update(
      productId,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        imageUrl: existingCartItem.imageUrl,
        quantity: existingCartItem.quantity + 1,
      ),
    );
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (cartItems[productId]?.quantity == 1) {
      return;
    }

    _items.update(
      productId,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        imageUrl: existingCartItem.imageUrl,
        quantity: existingCartItem.quantity - 1,
      ),
    );
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
