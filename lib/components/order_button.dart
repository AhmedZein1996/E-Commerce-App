import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/screens/order/orders_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    this.text,
    this.press,
    this.cart,
    this.cartItemsValues,
  }) : super(key: key);

  final String text;
  final Function press;
  final Cart cart;
  final List<CartItem> cartItemsValues;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: kPrimaryColor,
          textColor: Theme.of(context).primaryColor,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Provider.of<Orders>(context, listen: false).addOrder(
              widget.cartItemsValues,
              widget.cart.totalAmount,
            );
            widget.cart.clear();
            Navigator.of(context).pushNamed(OrderScreen.routeName);
          }),
    );
  }
}
//child: Text(
//widget.text,
//style: TextStyle(
//fontSize: getProportionateScreenWidth(18),
//color: Colors.white,
//),
//),
