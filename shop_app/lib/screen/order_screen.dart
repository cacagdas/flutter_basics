import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/orders.dart' show Orders;
import 'package:shopapp/screen/order_item.dart';
import 'package:shopapp/widget/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, i) => OrderItem(orderData.orders[i])),
    );
  }
}