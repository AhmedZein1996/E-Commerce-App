import 'package:flutter/material.dart';
import 'package:shop_app/chat_pakage/favourite_chats.dart';
import 'package:shop_app/chat_pakage/recent_chats.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/size_config.dart';

import 'catigory_selector.dart';

class ChatApp extends StatefulWidget {
  static const String routeName = 'chatAppid';
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  AppBar appBar;
  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
      elevation: 0.0,
      title: Text('Chats',
          style: TextStyle(
              fontSize: getProportionateScreenHeight(35),
              fontWeight: FontWeight.bold,
              color: accentColor)),
      backgroundColor:
          Theme.of(context).copyWith(primaryColor: Colors.red).primaryColor,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 30.0,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
    return Scaffold(
      backgroundColor:
          Theme.of(context).copyWith(primaryColor: Colors.red).primaryColor,
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.messages),
      appBar: appBar,
      body: Column(
        children: <Widget>[
          CategorySellector(),
          Expanded(
            child: Container(
                height: SizeConfig.screenHeight * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    FavouriteChats(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: RecentChats(),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
