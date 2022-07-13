import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final int quantity;
  double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price
});

}

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};
  //Cart(this._items);
  Map<String, CartItem> get iteMs{
    return _items;
  }
  int get totalCartIteMs{
    return _items.length;
  }
  void addItem(String productId, String title, double price){
    if(_items.containsKey(productId)){
      _items.update(productId, (existingCartIteM) => CartItem(id: existingCartIteM.id,
          title: existingCartIteM.title,
          price: existingCartIteM.price,
          quantity: existingCartIteM.quantity + 1
      ));
    }
    else{
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }
}