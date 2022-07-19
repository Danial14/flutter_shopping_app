import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/providers/order_item.dart' show Orders;
import 'package:shopping_cart_app/widgets/app_drawer.dart';
import 'package:shopping_cart_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget{
  static const String ROUTENAME = "/ordersscreen";
  @override
  Widget build(BuildContext context) {
    var ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your orders"),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return OrderIteM(ordersData.orderIteMs[index]);
      },
        itemCount: ordersData.orderIteMs.length,),
    drawer: AppDrawer(),
    );
  }
}