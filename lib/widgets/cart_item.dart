import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget{
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  CartItem(this.id, this.price, this.quantity, this.title, this.productId);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction){
        return showDialog(context: context, builder: (ctx){
          return AlertDialog(
            title: Text("Are you sure?"),
            content: Text("Do you want to delete iteM from cart"),
            actions: <Widget>[
              FlatButton(onPressed: (){
                Navigator.of(ctx).pop(false);
              }, child: Text("No")),
              FlatButton(onPressed: (){
                Navigator.of(ctx).pop(true);
              }, child: Text("Yes"))
            ],
          );
        });
      },
      onDismissed: (direction){
        var cart = Provider.of<Cart>(context, listen: false);
        cart.removeIteM(productId);
      },
        direction: DismissDirection.endToStart,
      key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(Icons.delete,
            color: Colors.white,),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
        ),
        child: Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(3),
              child: FittedBox(child: Text("\$${price}", style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
              )
              ),
          )
          ),
          title: Text(title),
          subtitle: Text("Total: \$${price * quantity}"),
          trailing: Text("$quantity x"),
        ),
      ),
    )
    );
  }
}