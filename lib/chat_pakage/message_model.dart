import 'package:flutter/cupertino.dart';
import 'package:shop_app/chat_pakage/user_model.dart';

class Messages {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unRead;

  Messages(
      {@required this.sender,
      @required this.time,
      @required this.text,
      @required this.isLiked,
      @required this.unRead});
}

final User currentUser =
    User(imageUrl: 'assets/images/me.jpg', id: 1, name: 'me');
final User meto = User(imageUrl: 'assets/images/meto.jpg', id: 2, name: 'meto');
final User khaled =
    User(imageUrl: 'assets/images/khaled.jpg', id: 3, name: 'khaled');
final User zein = User(imageUrl: 'assets/images/zein.jpg', id: 4, name: 'zein');
final User somaa =
    User(imageUrl: 'assets/images/UserImage.jpg', id: 5, name: 'somaa');

List<User> favorites = [meto, khaled, zein, somaa, zein, somaa];
List<Messages> chats = [
  Messages(
      sender: zein,
      time: '9:30 PM',
      text: 'Hello Sayed How are You today we will work on Grad Project ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: currentUser,
      time: '9:30 PM',
      text: 'Hello Sayed How are You today we will work on Grad Project ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: currentUser,
      time: '9:30 PM',
      text: 'Hello Sayed How are You today we will work on Grad Project ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: meto,
      time: '10:30 PM',
      text: 'Hello friend How are You ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: khaled,
      time: '11:30 PM',
      text: 'Hello mate How are You ? ',
      isLiked: false,
      unRead: false),
  Messages(
      sender: zein,
      time: '9:30 PM',
      text: 'Hello Sayed How are You today we will work on Grad Project ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: meto,
      time: '10:30 PM',
      text: 'Hello friend How are You ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: khaled,
      time: '11:30 PM',
      text: 'Hello mate How are You ? ',
      isLiked: false,
      unRead: false),
  Messages(
      sender: zein,
      time: '9:30 PM',
      text: 'Hello Sayed How are You today we will work on Grad Project ? ',
      isLiked: true,
      unRead: true),
  Messages(
      sender: meto,
      time: '10:30 PM',
      text: 'Hello friend How are You ? ',
      isLiked: false,
      unRead: true),
  Messages(
      sender: khaled,
      time: '11:30 PM',
      text: 'Hello mate How are You ? ',
      isLiked: false,
      unRead: false),
];
