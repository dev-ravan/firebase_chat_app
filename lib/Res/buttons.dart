import 'package:flutter/material.dart';
import 'package:my_chat_app/Res/colors.dart';
import 'package:my_chat_app/Res/texts.dart';

class MyButtons {
  Widget customButton({
    required BuildContext context,
    required String title,
    required Function onTap,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Palette.black,
      child: InkWell(
        onTap: onTap as void Function(),
        child: SizedBox(
          height: 65,
          width: double.infinity,
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: Palette.white,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          )),
        ),
      ),
    );
  }

  Widget redButton({
    required String title,
    required Function onTap,
  }) {
    return InkWell(
        onTap: onTap as void Function(),
        child: MyTexts().MiniRedText(text: title));
  }
}
