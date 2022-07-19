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
  void removeIteM(String productId){
    iteMs.remove(productId);
    notifyListeners();
  }
  void clear(){
    _items = {};
    notifyListeners();
  }
  int get totalCartIteMs{
    return _items.length;
  }
  double get totalPrice{
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
  void addItem(String productId, String title, double price){
    if(_items.containsKey(productId)){
      print("same cart");
      _items.update(productId, (existingCartIteM) => CartItem(id: existingCartIteM.id,
          title: existingCartIteM.title,
          price: existingCartIteM.price,
          quantity: existingCartIteM.quantity + 1
      ));
    }
    else{
      print("different cart");
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }
  void reMoveSingleIteM(String productId){
    if(_items.containsKey(productId)){
      CartItem cartItem = _items[productId]!;
      if(cartItem.quantity > 1){
        _items.update(productId, (value) => CartItem(
          id: DateTime.now().toString(),
          title: value.title,
          quantity: value.quantity - 1,
          price: value.price
        ));
        notifyListeners();
      }
      else{
        removeIteM(productId);
      }
    }
  }
}