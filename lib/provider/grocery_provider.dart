import 'package:flutter/material.dart';

class GroceryProvider with ChangeNotifier {
  final List _groceryItems = [
    ["Fruits", "120", "assets/images/fruits.png", Colors.yellow],
    ["Vegetables", "80", "assets/images/vegetables.png", Colors.green],
    ["Groceries", "120", "assets/images/groceries.png", Colors.brown],
    ["Food", "180", "assets/images/food.png", Colors.blue],
  ];

  get groceryItems => _groceryItems;

  final List _cartItems = [];
  get cartItems => _cartItems;

  void addItemsToCart(index) {
    _cartItems.add(_groceryItems[index]);
    notifyListeners();
  }

  void removeItemsToCart(index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateItems() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
