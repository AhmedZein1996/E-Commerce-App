import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:provider/provider.dart';
import 'package:shop_app/models/user.dart';

class ProfilePic extends StatefulWidget {
  final fileImage;

  ProfilePic({this.fileImage});

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File _storedImage;

  File _imageFile;

  // File profileImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedFile == null) {
      return;
    }
    _imageFile = File(pickedFile.path);
    setState(() {
      _storedImage = _imageFile;
    });
    final appDirectory = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(_imageFile.path);
    final savedImage = await _imageFile.copy('${appDirectory.path}/$fileName');
    if (savedImage == null) {
      print('can not save image');
      return;
    }
    Provider.of<UserProfileProvider>(context, listen: false)
        .addUser(savedImage);
//    if (userProfile.users.isEmpty) {
//      userProfile.addUser(savedImage);
//    } else {
//      userProfile.updateUserProfile(savedImage);
//    }
  }

  @override
  Widget build(BuildContext context) {
    //profileImage = _getUser as File;
    return FutureBuilder(
      future:
          Provider.of<UserProfileProvider>(context, listen: false).fetchUser(),
      // ignore: missing_required_param
      builder: (context, snapshot) => Consumer<UserProfileProvider>(
        builder: (BuildContext context, usersProfile, Widget child) => SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: _storedImage != null
                    ? FileImage(_storedImage)
                    : usersProfile.users.length <= 0
                        ? AssetImage("assets/images/Profile Image.png")
                        : FileImage(usersProfile.users.last.profileImage),
                //FileImage(snapshot.data),
              ),
              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Color(0xFFF5F6F9),
                    onPressed: _takePicture,
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
