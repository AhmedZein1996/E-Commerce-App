import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: cart.isInCart(product.productId)
                            ? DefaultButton(
                                text: 'Add To Cart',
                                press: () {
                                  Scaffold.of(context).hideCurrentSnackBar();
                                  Scaffold.of(context).showSnackBar(
                                    buildSnackBar(cart, true),
                                  );
                                },
                              )
                            : DefaultButton(
                                text: "Add To Cart",
                                press: () {
                                  cart.addItemToCart(
                                    product.productId,
                                    product.title,
                                    product.price,
                                    product.images,
                                  );
                                  Scaffold.of(context).hideCurrentSnackBar();
                                  Scaffold.of(context).showSnackBar(
                                    buildSnackBar(cart, false),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SnackBar buildSnackBar(Cart cart, bool inCart) {
    return SnackBar(
      content: inCart
          ? Text(
              'This item aleardy in the cart, Please press at plus icon to add one more item',
              textAlign: TextAlign.center,
            )
          : Text('Add item to cart'),
      duration: Duration(
        seconds: 1,
      ),
      action: inCart
          ? null
          : SnackBarAction(
              label: 'UNDO',
              textColor: Colors.limeAccent,
              onPressed: () {
                cart.removeSingleItem(product.productId, product);
              },
            ),
    );
  }
}
