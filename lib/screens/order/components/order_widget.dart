import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/orders.dart';

class OrderWidget extends StatefulWidget {
  final OrderItem orderItem;

  OrderWidget({this.orderItem});

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    // var products = widget.orderItem.products;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Theme.of(context).primaryColor,
      color: Color(0xFFF5F6F9),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            child: ListTile(
              leading: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:  'total Price : ',
                      style: TextStyle(
                         fontSize: 18, ),
                    ),
                    TextSpan(
                      text: '\$${widget.orderItem.amount}',
                      style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                    ),
                    ),
                  ],
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  DateFormat('dd/MM/yy  hh:mm')
                      .format(widget.orderItem.dateTime),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.orderItem.products.length * 60.0 , 200),
              child: ListView(
                children: widget.orderItem.products
                    .map(
                      (product) => ListTile(
                        leading: Text(
                          '${product.title} :',
                          style: TextStyle(
                            fontSize: 16,

                          ),
                        ),
                        title: Padding(
                          padding: product.title.length < 4
                              ? const EdgeInsets.only(left: 140.0)
                              : product.title.length < 6
                              ? const EdgeInsets.only(left: 130.0)
                              : product.title.length < 7
                                  ? const EdgeInsets.only(left: 120.0)
                              : product.title.length <= 8
                              ? const EdgeInsets.only(left: 105.0)
                         : product.title.length < 10
                              ? const EdgeInsets.only(left: 90.0)
                              : product.title.length < 12
                              ? const EdgeInsets.only(left: 80.0)
                                  : product.title.length < 19
                                      ? const EdgeInsets.only(left: 40.0)
                                      : const EdgeInsets.only(left: 30.0),
                          child: Text(
                            '\$${product.price}',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(
                            '${product.quantity}x',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
