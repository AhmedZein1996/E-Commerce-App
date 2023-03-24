import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/helper/db_helper.dart';

class UserProfile {
  final String id;
  final File profileImage;

  UserProfile({
    @required this.id,
    @required this.profileImage,
  });
}

class UserProfileProvider with ChangeNotifier {
  List<UserProfile> _users = [];

  List<UserProfile> get users {
    return [..._users];
  }

  void addUser(File image) {
    final newUser = UserProfile(
      id: DateTime.now().toString(),
      profileImage: image,
    );
    _users.add(newUser);
    notifyListeners();
    DBHelper.insertToDb('user_places', {
      'id': newUser.id,
      'image': newUser.profileImage.path,
    });
  }

  void updateUserProfile(File image) async {
    final newUser = UserProfile(
      id: DateTime.now().toString(),
      profileImage: image,
    );
    _users.insert(0, newUser);
    notifyListeners();
    DBHelper.updateDb('user_places', {
      'id': newUser.id,
      'image': newUser.profileImage.path,
    });
  }

  Future<void> fetchUser() async {
    final dataList = await DBHelper.getFromDb('user_places');
    _users = dataList
        .map(
          (item) => UserProfile(
            id: item['id'],
            profileImage: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
