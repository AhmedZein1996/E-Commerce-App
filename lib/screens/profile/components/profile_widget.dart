import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final imageFile;

  const ProfileWidget({this.imageFile});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      width: 135,
      child: FittedBox(
        child: CircleAvatar(
          backgroundImage:
              imageFile is File ? FileImage(imageFile) : AssetImage(imageFile),
        ),
      ),
    );
  }
}
