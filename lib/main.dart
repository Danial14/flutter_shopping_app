import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/providers/cart.dart';
import 'package:shopping_cart_app/providers/order_item.dart';
import 'package:shopping_cart_app/providers/product.dart';
import 'package:shopping_cart_app/screens/cart_screen.dart';
import 'package:shopping_cart_app/screens/edit_product_screen.dart';
import 'package:shopping_cart_app/screens/orders_screen.dart';
import 'package:shopping_cart_app/screens/product_detail.dart';
import 'package:shopping_cart_app/screens/product_overview_screen.dart';
import 'package:shopping_cart_app/screens/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context){
     return Products();
    }),
    ChangeNotifierProvider(create: (context){
          return Cart();
        }),
    ChangeNotifierProvider(
      create: (context){
        return Orders();
      },
    )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        accentColor: Colors.orange
      ),
      home: ProductOverview(),
      routes: {
        ProductDetail.routeNaMe : (context){
          return ProductDetail();
        },
        CartScreen.ROUTE : (context){
          return CartScreen();
        },
        OrdersScreen.ROUTENAME : (context){
          return OrdersScreen();
        },
        UserProductsScreen.RouteName : (context){
          return UserProductsScreen();
        },
        EditProductScreen.ROUTENAME : (context){
          return EditProductScreen();
        }
      },
    )
    );
  }
}

