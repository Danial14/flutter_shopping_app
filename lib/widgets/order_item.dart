import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_cart_app/providers/order_item.dart' as ord;

class OrderIteM extends StatefulWidget{
  final ord.OrderItem orderItem;
  OrderIteM(this.orderItem);
  @override
  State<OrderIteM> createState() {
    // TODO: implement createState
    return OrderState();
  }
}
class OrderState extends State<OrderIteM>{
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(title: Text("\$${widget.orderItem.amount}"),
            subtitle: Text(DateFormat("dd MM yyyy hh:mm").format(widget.orderItem.dateTime)),
            trailing: IconButton(icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: (){
              setState(() {
                _expanded = !_expanded;
              });
              },),),
          if(_expanded)
            Container(
              height: min(100, 180),
            child: ListView.builder(itemBuilder: (context, index){
              return ListTile(
                leading: Text(widget.orderItem.products[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                trailing: Text(
                  "${widget.orderItem.products[index].quantity}x \$${widget.orderItem.products[index].price}"
                ),
              );
            },
            itemCount: widget.orderItem.products.length,
            )
            )
        ],
      ),
    );
  }
}