import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget{
  final String title;
  final String iMageUrl;
  UserProductItem(this.title, this.iMageUrl);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
     child: ListTile(
      title: Text(title),
      leading: CircleAvatar(
      backgroundImage: NetworkImage(iMageUrl),
    ),
    trailing: Container(
      width: MediaQuery.of(context).size.width * 23 / 100,
    child:Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit,
          color: Theme.of(context).primaryColor,
          ), onPressed: () {

        },
        ),
        IconButton(onPressed: () {

        },
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
        ),
        )
      ],
    ),
    )
    )
      );
  }
}