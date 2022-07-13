import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/providers/product.dart';

import '../model/product.dart';

class ProductDetail extends StatelessWidget{
  String id = "";
  static String routeNaMe = "/ProductDetail";
  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String;
    Product product = Provider.of<Products>(context).getIteMs.firstWhere((eleMent){
      return id == eleMent.id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}