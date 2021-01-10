import 'package:shopping_cart_app/bloc/cart_items_bloc.dart' as card_bloc;
import 'package:shopping_cart_app/bloc/info_items_bloc.dart' as info_bloc;
import 'package:flutter/material.dart';

class ShopItems extends StatelessWidget {
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
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: card_bloc.bloc.allItems,
      stream: card_bloc.bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["shop items"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}

Widget shopItemsListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        title: Text(shopList[i]['name']),
        subtitle: Text("\$${shopList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            card_bloc.bloc.addToCart(shopList[i]);
          },
        ),
        onTap: () {
          print(shopList[i]);
          info_bloc.bloc.setInfoData(shopList[i]);
          Navigator.pushNamed(context, '/info');
        },
      );
    },
  );
}
