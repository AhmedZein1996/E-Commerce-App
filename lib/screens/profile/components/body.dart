import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/screens/profile/components/user_account.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder(
        future: Provider.of<UserProfileProvider>(context, listen: false)
            .fetchUser(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? CircularProgressIndicator()
                : Consumer<UserProfileProvider>(
                    builder:
                        (BuildContext context, usersProfile, Widget child) =>
                            Column(
                      children: [
                        ProfilePic(
                            //fileImage: usersProfile.users.last.profileImage,
                            ),
                        SizedBox(height: 20),
                        ProfileMenu(
                          text: "My Account",
                          icon: "assets/icons/User Icon.svg",
                          press: () => Navigator.of(context).pushNamed(
                              UserAccount.routeName,
                              arguments: usersProfile.users.isEmpty
                                  ? "assets/images/Profile Image.png"
                                  : usersProfile.users.last.profileImage),
                        ),
                        ProfileMenu(
                          text: "Notifications",
                          icon: "assets/icons/Bell.svg",
                          press: () {},
                        ),
                        ProfileMenu(
                          text: "Settings",
                          icon: "assets/icons/Settings.svg",
                          press: () {},
                        ),
                        ProfileMenu(
                          text: "Help Center",
                          icon: "assets/icons/Question mark.svg",
                          press: () {},
                        ),
                        ProfileMenu(
                          text: "Log Out",
                          icon: "assets/icons/Log out.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
