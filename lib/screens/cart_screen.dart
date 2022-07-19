import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_item.dart';
import '../widgets/cart_item.dart';

import '../providers/cart.dart' show Cart;
import '../providers/cart.dart' as ci;
class CartScreen extends StatelessWidget{
  static const ROUTE = "/cartscreen";
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    List<ci.CartItem> carts = cart.iteMs.values.toList();
    List keys = cart.iteMs.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your cart"),
      ),
      body: Column(
        children : <Widget>[
          Card(margin: const EdgeInsets.all(15),
            child: Padding(padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                const Text("Total",
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                const Spacer(),
                Chip(
                  label: Text("\$${cart.totalPrice.toStringAsFixed(2)}", style: const TextStyle(
                    color: Colors.white
                  ),),
                  backgroundColor: Colors.purple,
                ),
                FlatButton(
                  child: const Text("Order now"),
                  onPressed: (){
                    Provider.of<Orders>(context, listen: false).addOrder(carts, cart.totalPrice);
                    cart.clear();
                  },
                )
              ],
            ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(itemBuilder: (context, index){
            var cartIteM = carts[index];
            return CartItem(cartIteM.id, cartIteM.price, cartIteM.quantity, cartIteM.title, keys[index]);
          },
          itemCount: cart.iteMs.length,
          ))
        ],
      ),
    );
  }
}