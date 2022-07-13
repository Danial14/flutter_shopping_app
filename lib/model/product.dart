import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String description;
  final String title;
  bool isFavouriate;
  final double price;
  final String iMageUrl;
  Product({
    required this.id,
    required this.description,
    required this.title,
    required this.price,
    required this.iMageUrl,
    this.isFavouriate = false
  });
  void toogleFavouriate(){
    this.isFavouriate = !this.isFavouriate;
    notifyListeners();
  }
}