import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List _shoeModel = [
    ["129.00", "lib/images/nike1.jpg", "Nike Air Max", "4.6"],
    ["137.87", "lib/images/nike2.jpg", "Nike Sneaker", "4.4"],
    ["155.90", "lib/images/nike3.jpg", "Nike Air Jordan", "4.3"],
    ["160.99", "lib/images/nike4.jpg", "Jordan 1 Mid", "4.5"],
    ["147.00", "lib/images/nike5.webp", "Nike Air vaporMax", "4.8"],
  ];
  List _cartItems = [];

  get shoeModel => _shoeModel;
  get cartItems => _cartItems;

  void addItem(int index) {
    _cartItems.add(_shoeModel[index]);
    notifyListeners();
  }
  void removeItem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
 String calculateTotal(){
    double totalPrice=0;
    for(int i=0;i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][0]);
    }
    return totalPrice.toStringAsFixed(2);
 }
}
