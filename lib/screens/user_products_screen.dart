import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/providers/product.dart';
import 'package:shopping_cart_app/screens/edit_product_screen.dart';
import 'package:shopping_cart_app/widgets/UserProductItem.dart';

class UserProductsScreen extends StatelessWidget{
  static const RouteName = "/UserProducts";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.ROUTENAME);
            },
          )
        ],
      ),
      body: Container(
        child: Consumer<Products>(
          builder: (ctx, product, ch){
          return ListView.builder(itemBuilder: (ct, index){
            return UserProductItem(product.getIteMs[index].title, product.getIteMs[index].iMageUrl);
    }, itemCount: product.getIteMs.length,
          );
    },
    ),
    )
    );
  }
}