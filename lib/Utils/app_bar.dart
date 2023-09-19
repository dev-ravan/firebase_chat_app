// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_chat_app/Feature/Auth/Repo/auth_service.dart';
import 'package:my_chat_app/Res/colors.dart';

import '../Feature/Auth/View/login.dart';
import '../Res/texts.dart';

PreferredSizeWidget MyAppBar({required BuildContext context}) {
  return AppBar(
    title: MyTexts().WhiteLogoText(size: 40),
    centerTitle: true,
    backgroundColor: Palette.black,
    actions: [
      IconButton(
          onPressed: () {
            AuthService().logOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          icon: Icon(
            Icons.logout,
            color: Palette.white,
          )),
    ],
  );
}
