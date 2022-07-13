import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/product.dart';
import '../widgets/ProductIteM.dart';

class ProductsGrid extends StatelessWidget{
  bool _isFavs;
  ProductsGrid(this._isFavs);
  @override
  Widget build(BuildContext context) {
    List<Product> products;
    if(_isFavs){
      products = Provider.of<Products>(context).getFavouriates;
    }
    else{
      products = Provider.of<Products>(context).getIteMs;
      print("productgrid rebuild");
    }
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index){
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductIteM(products[index].title, products[index].iMageUrl, products[index].id),);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 3 / 2
      ),
    );
  }
}