import 'package:flutter/material.dart';
import 'package:shopping_cart_app/screens/orders_screen.dart';
import 'package:shopping_cart_app/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello friend"),
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage products"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.RouteName);
            },
          )
        ],
      ),
    );
  }
}