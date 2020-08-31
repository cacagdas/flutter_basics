import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/orders.dart' show Orders;
import 'package:shopapp/widget/order_item.dart';
import 'package:shopapp/widget/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<Orders>(context, listen: false).fetchOrders(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else {
              if (dataSnapshot.error != null)
                return Center(child: Text('Error'));
              else {
                return Consumer<Orders>(
                  builder: (context, orderData, child) => ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (context, i) =>
                          OrderItem(orderData.orders[i])),
                );
              }
            }
          },
        ));
  }
}
