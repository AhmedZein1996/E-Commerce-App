import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'cart.dart';

class OrderItem {
  final String id;
  final String amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orderItems = [];

  List<OrderItem> get orders {
    return [..._orderItems];
  }

//  Future<void> fetchOrders() async {
//    final url =
//        'https://grad-project-eef28-default-rtdb.firebaseio.com/orders.json';
//    try {
//      final response = await http.get(url);
//      final fetchedData = json.decode(response.body) as Map<String, dynamic>;
//      if (fetchedData == null) {
//        return;
//      }
//      final List<OrderItem> _loadedOrders = [];
//      fetchedData.forEach((orderId, order) {
//        _loadedOrders.add(OrderItem(
//          id: orderId,
//          amount: order['amount'],
//          dateTime: DateTime.parse(order['dateTime']),
//          products: (order['products'] as List<dynamic>)
//              .map(
//                (cartItem) => CartItem(
//                  id: cartItem['id'],
//                  title: cartItem['title'],
//                  price: cartItem['price'],
//                  quantity: cartItem['quantity'],
//                  images: cartItem['imageUrl'],
//                ),
//              )
//              .toList(),
//        ));
//      });
//
//      _orderItems = _loadedOrders.reversed.toList();
//      notifyListeners();
//    } catch (error) {
//      throw error;
//    }
//  }

  Future<void> addOrder(List<CartItem> cartItems, String total) async {
//    final url =
//        'https://grad-project-eef28-default-rtdb.firebaseio.com/orders.json';
//    final dateTime = DateTime.now();
//    try {
//      final response = await http.post(
//        url,
//        body: json.encode({
//          'amount': total,
//          'dateTime': dateTime.toIso8601String(),
//          'products': cartItems
//              .map((cartItem) => {
//                    'id': cartItem.id,
//                    'price': cartItem.price,
//                    'title': cartItem.title,
//                    'quantity': cartItem.quantity,
//                    'imageUrl': cartItem.images[0],
//                  })
//              .toList(),
//        }),
//      );
    if (cartItems.isNotEmpty) {
      _orderItems.add(
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          products: cartItems,
          dateTime: DateTime.now(),
        ),
      );
    }
    notifyListeners();
//    } catch (error) {
//      throw error;
//    }
  }
}
