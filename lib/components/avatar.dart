import 'package:flutter/material.dart';
import 'package:mprj/components/components.dart';
import 'package:mprj/models/models.dart';

class Avatar extends StatelessWidget {
  Avatar(
    this.user,
  );
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    if (user.photoUrl == '') {
      return LogoGraphicHeader();
    }
    return Hero(
      tag: 'User Avatar Image',
      child: CircleAvatar(
          // foregroundColor: Colors.blue,
          backgroundColor: Colors.black12,
          radius: 46.0,
          child: ClipOval(
            child: Image.network(
              user.photoUrl,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
          )),
    );
  }
}
