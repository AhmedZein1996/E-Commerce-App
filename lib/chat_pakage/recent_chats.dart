import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import 'chat_page.dart';
import 'message_model.dart';

class RecentChats extends StatefulWidget {
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  var mediaQuery;
  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Messages chat = chats[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage(
                            user: chat.sender,
                          ))),
              child: Container(
                margin: EdgeInsets.only(top: 0.0, right: 5.0),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: chat.unRead ? Color(0xFFFFEFEE) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(chat.sender.imageUrl),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chats[index].sender.name,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                chat.text,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          chat.time,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: mediaQuery.size.height * 0.006,
                        ),
                        chat.unRead
                            ? Container(
                                width: SizeConfig.screenWidth * 0.13,
                                height: SizeConfig.screenWidth * 0.063,
                                child: Center(
                                    child: Text(
                                  'new',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.screenWidth * .035,
                                  ),
                                )),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30)),
                              )
                            : Text(''),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: chats.length,
      ),
    );
  }
}
