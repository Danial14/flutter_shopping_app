import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/providers/cart.dart';
import 'package:shopping_cart_app/screens/cart_screen.dart';
import 'package:shopping_cart_app/widgets/app_drawer.dart';
import '../screens/ProductsGrid.dart';
import '../widgets/badge.dart';

enum Options{
  Favouriates,
  All
}
class ProductOverview extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductsOverviewState();
  }
}
class ProductsOverviewState extends State<ProductOverview>{
  bool _showFavouriate = false;
  @override
  Widget build(BuildContext context) {
    //var products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My shop"),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (_){
            return[
              PopupMenuItem(child: Text("Favouriates only"), value: Options.Favouriates,),
              PopupMenuItem(child: Text("Show all"), value: Options.All)
            ];
          },
            onSelected: (Options selectedValue){
              switch(selectedValue){
                case Options.All:
                  setState(() {
                    _showFavouriate = false;
                  });
                  break;
                case Options.Favouriates:
                  setState(() {
                    _showFavouriate = true;
                  });
                  break;
              }
            },
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(builder: (_, cart, ch) {
           return Badge(child: ch!,
              value: cart.totalCartIteMs.toString(),
            );
          },
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.ROUTE);
                }
            )
          )
        ],
      ),
      body: ProductsGrid(_showFavouriate),
      drawer: AppDrawer(),
    );

  }
}