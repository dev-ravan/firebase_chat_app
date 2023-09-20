import 'package:flutter/material.dart';
import 'package:my_chat_app/Res/colors.dart';

class MyTextFields {
  Widget authField(
      {required String hintText,
      required TextEditingController controller,
      required String? Function(String?) validator,
      bool? obscure,
      required IconData icon}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.red)),
      ),
    );
  }

// Message text field
  Widget sendMessageField({
    required TextEditingController controller,
    required Function onTap,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: const Icon(Icons.send), onPressed: onTap as void Function()),
        hintText: "Type here..",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.red)),
      ),
    );
  }
}
