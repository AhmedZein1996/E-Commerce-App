import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import 'chat_page.dart';
import 'message_model.dart';

class FavouriteChats extends StatefulWidget {
  @override
  _FavouriteChatsState createState() => _FavouriteChatsState();
}

class _FavouriteChatsState extends State<FavouriteChats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                "Favourite Contacts",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: SizeConfig.screenHeight * .03,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {}),
            )
          ],
        ),
        Container(
          // Favourite Contacts BackGround Color
          color: Colors.white10,
          height: SizeConfig.screenHeight * .13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(
                                user: favorites[index],
                              ))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(8),
                        horizontal: getProportionateScreenWidth(10)),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.screenHeight * .037,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        Text(
                          favorites[index].name.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(16),
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: favorites.length,
          ),
        )
      ],
    );
  }
}
