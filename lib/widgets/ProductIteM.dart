import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/model/product.dart';
import 'package:shopping_cart_app/providers/cart.dart';
import 'package:shopping_cart_app/screens/product_detail.dart';

class ProductIteM extends StatelessWidget{
  final String iMageUrl;
  final String id;
  final String title;
  ProductIteM(this.title, this.iMageUrl, this.id);
  @override
  Widget build(BuildContext context){
    Product product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetail.routeNaMe, arguments: id);
          },
        child: GridTile(
      child: Image.network(iMageUrl,
      fit: BoxFit.cover,
    ),
    footer: GridTileBar(
      backgroundColor: Colors.black54,
      title: Text(title, textAlign: TextAlign.center,),
      leading: Consumer<Product>(builder: (c, product, ch){
        return IconButton(
          icon: product.isFavouriate ? Icon(Icons.favorite,
            color: Theme.of(context).accentColor,) : Icon(Icons.favorite_outline_outlined, color: Theme.of(context).accentColor,),
          onPressed: (){
            product.toogleFavouriate();
          },
        );
      }),
      trailing: IconButton(
        icon: Icon(Icons.shopping_cart,
        color: Theme.of(context).accentColor,
        ),
        onPressed: (){
          cart.addItem(product.id, product.title, product.price);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Added iteM to the cart!", textAlign: TextAlign.center,),
            action: SnackBarAction(
              label: "Undo",
              onPressed: (){
                cart.reMoveSingleIteM(id);
              },
            ),
          ));
        },
      ),
    ),
    )
        )
    );
  }
}