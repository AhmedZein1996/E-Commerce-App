import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ContainerWithCounter extends StatelessWidget {
  final String productId;

  ContainerWithCounter({this.productId});
  static const List<int> selection_nofProduct_List = [
    0,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    100,
  ];
  DropdownButton<int> getDropdownButtonCurrencies(context, productId) {
    List<DropdownMenuItem<int>> dropDownItem = [];
    final cart = Provider.of<Cart>(context, listen: true);
    final productQuantity = cart.numberOfProductPieces(productId);
    final prodQuantity = 10 * (productQuantity ~/ 10);
    for (int number in selection_nofProduct_List) {
      var newItem = DropdownMenuItem(
        child: Text('$number'),
        value: number,
      );
      dropDownItem.add(newItem);
    }

    return DropdownButton(
      dropdownColor: Colors.white,
      style: TextStyle(
        color: kPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      value: prodQuantity,
      items: dropDownItem,
      onChanged: (value) {
        int selectedNumber;
        selectedNumber = value;
        cart.updateItemQuantityInputByUser(productId, selectedNumber);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Visibility(
      visible: cart.isInCart(productId) ? true : false,
      child: Container(
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(60),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.4),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Colors.white),
        ),
        child: getDropdownButtonCurrencies(context, productId),
      ),
    );
  }

  SnackBar buildSnackBar(Cart cart, bool inCart) {
    return SnackBar(
      content: Text(
        'Pleaase, enter a number greater than 0',
        textAlign: TextAlign.center,
      ),
      duration: Duration(milliseconds: 1500),
    );
  }
}
