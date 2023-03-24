import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class CategorySellector extends StatefulWidget {
  @override
  _CategorySellectorState createState() => _CategorySellectorState();
}

class _CategorySellectorState extends State<CategorySellector> {
  int selectedIndex = 0;
  final List<String> categories = [
    "Messages",
    "Online",
    "Group",
    "Requsted",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: SizeConfig.screenHeight * .1,
        color:
            Theme.of(context).copyWith(primaryColor: Colors.red).primaryColor,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                    horizontal: getProportionateScreenWidth(30)),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: SizeConfig.screenHeight * .03,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.white60),
                ),
              ),
            );
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
