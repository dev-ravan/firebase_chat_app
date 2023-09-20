// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'colors.dart';

class MyTexts {
  Widget LogoText({required double size}) {
    return Text("yChat",
        style: TextStyle(
            color: Palette.black,
            fontSize: size,
            fontFamily: "DancingScript",
            fontWeight: FontWeight.bold));
  }

  Widget WhiteLogoText({required double size}) {
    return Text("yChat",
        style: TextStyle(
            color: Palette.white,
            fontSize: size,
            fontFamily: "DancingScript",
            fontWeight: FontWeight.bold));
  }

  Widget TitleText({required String text}) {
    return Text(text,
        style: TextStyle(
            color: Palette.black,
            fontSize: 35,
            fontFamily: "DMSans",
            fontWeight: FontWeight.bold));
  }

  Widget DMSansNormalBlackText({required String text, required double size}) {
    return Text(text,
        style: TextStyle(
            color: Palette.black,
            fontSize: size,
            fontFamily: "DMSans",
            fontWeight: FontWeight.normal));
  }

  Widget MiniRedText({required String text}) {
    return Text(text,
        style: TextStyle(
            color: Palette.red,
            fontSize: 15,
            fontFamily: "DMSans",
            fontWeight: FontWeight.normal));
  }
}
