import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/screens/order/components/order_widget.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = "/order";
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
//  Future _ordersFuture;
//  Future _obtainOrdersFuture() {
//    return Provider.of<Orders>(context, listen: false).fetchOrders();
//  }

//  @override
//  void initState() {
//    _ordersFuture = _obtainOrdersFuture();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderWidget(
          orderItem: orderData.orders[index],
        ),
      ),
    );
  }
}
