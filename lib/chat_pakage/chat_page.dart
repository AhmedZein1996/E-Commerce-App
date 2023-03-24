import 'package:flutter/material.dart';
import 'package:shop_app/chat_pakage/message_model.dart';

import 'user_model.dart';

class ChatPage extends StatefulWidget {
  static String id = "ChatPage";
  final User user;
  ChatPage({this.user});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  MediaQueryData mediaQuery;
  AppBar appBar;
  _buildMessage(Messages message, bool isMe) {
    return Row(
      children: [
        Container(
          width: mediaQuery.size.width * 0.7,
          decoration: BoxDecoration(
              color: !isMe
                  ? Theme.of(context)
                      .copyWith(accentColor: Color.fromRGBO(228, 230, 235, 1))
                      .accentColor
                  : Color(0xFFFFEFEE),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          margin: isMe
              ? EdgeInsets.only(
                  top: mediaQuery.size.height * 0.005,
                  bottom: mediaQuery.size.height * 0.005,
                  left: mediaQuery.size.width * 0.3)
              : EdgeInsets.only(
                  top: mediaQuery.size.height * 0.005,
                  left: mediaQuery.size.width * 0.01,
                  bottom: mediaQuery.size.height * 0.005,
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.005,
              ),
              Text(
                message.text,
                style: TextStyle(
                    color: isMe ? Colors.black : Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
        isMe
            ? Text("")
            : IconButton(
                icon: !message.isLiked
                    ? Icon(Icons.favorite_border)
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                iconSize: 30,
                color: Colors.black,
                onPressed: () {},
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    appBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor:
          Theme.of(context).copyWith(primaryColor: Colors.red).primaryColor,
      title: Text(
        widget.user.name,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {})
      ],
    );
    return Scaffold(
      backgroundColor:
          Theme.of(context).copyWith(primaryColor: Colors.red).primaryColor,
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: mediaQuery.orientation == Orientation.portrait
                ? (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.viewInsets.bottom -
                        (mediaQuery.size.height * 0.005) * 3 -
                        mediaQuery.padding.top) *
                    0.91
                : (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.viewInsets.bottom -
                        (mediaQuery.size.height * 0.005) * 5 -
                        mediaQuery.padding.top) *
                    0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (context, index) {
                  final Messages message = chats[index];
                  bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                },
                itemCount: chats.length,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              height: mediaQuery.orientation == Orientation.portrait
                  ? mediaQuery.size.height * 0.1
                  : mediaQuery.size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.photo,
                          color: Colors.red,
                        ),
                      )),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),

                          // enabledBorder: InputBorder.none,
                          // border: InputBorder.none,
                          // focusedBorder: InputBorder.none,
                          // errorBorder: InputBorder.none,
                          // disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Hint here"),
                    ),
                    flex: 6,
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
