// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_chat_app/Res/colors.dart';

import '../Res/texts.dart';

PreferredSizeWidget MyAppBar(
    {required BuildContext context, required Function onTap}) {
  return AppBar(
    title: MyTexts().WhiteLogoText(size: 40),
    centerTitle: true,
    backgroundColor: Palette.black,
    actions: [
      IconButton(
          onPressed: onTap as void Function(),
          icon: Icon(
            Icons.logout,
            color: Palette.white,
          )),
    ],
  );
}
