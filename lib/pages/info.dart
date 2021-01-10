import 'package:shopping_cart_app/bloc/info_items_bloc.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  String data;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
            )
          ],
        ),
        body: StreamBuilder(
            stream: bloc.getStream,
            initialData: bloc.infoData,
            builder: (context, snapshot) {
              return Text('aaaa ${snapshot.data}');
            }));
  }
}
