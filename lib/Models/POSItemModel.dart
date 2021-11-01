import 'package:flutter/material.dart';

class PosItemModel extends ChangeNotifier {

  PosItemModel({required this.title, required this.imageUrl, required this.basePrice, required this.totalPrice, required this.stock});

  late final String title;
  late int basePrice;
  late int totalPrice;
  late String imageUrl;
  late int stock = 0;

  void setTitle(String item) {
    this.title = item;
    notifyListeners();
  }

  void increaseTotalPrice(int newValue) {
    this.totalPrice += newValue;
    notifyListeners();
  }

  int totalPriceOfSelected() {
    return basePrice * totalPrice;
  }
}
