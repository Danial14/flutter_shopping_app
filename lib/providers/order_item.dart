import 'package:flutter/material.dart';
import 'package:shopping_cart_app/providers/cart.dart' as ci;


class OrderItem{
  final String id;
  final double amount;
  final List<ci.CartItem> products;
  final DateTime dateTime;
  OrderItem({required this.id, required this.amount, required this.products, required this.dateTime});
}
class Orders with ChangeNotifier{
  List<OrderItem> _orders = [];
  List<OrderItem> get orderIteMs{
    return [..._orders];
  }
  void addOrder(List<ci.CartItem> cartProducts, double total){
    _orders.insert(0, OrderItem(
        id: DateTime.now().toString(),
        products: cartProducts,
        amount: total,
        dateTime: DateTime.now()
    )
    );
    notifyListeners();
  }
}