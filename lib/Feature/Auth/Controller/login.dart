import 'package:flutter/material.dart';
import 'package:my_chat_app/Feature/Auth/Repo/auth_service.dart';
import 'package:my_chat_app/Utils/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../Home/View/home.dart';

class LoginProvider extends ChangeNotifier {
  // Global form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login
  void logIn({required BuildContext context}) {
    try {
      final authProvider = Provider.of<AuthService>(context, listen: false);
      authProvider
          .loginWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()))
              });
    } catch (e) {
      SnackBars.showSnackBar(
          context: context, message: "Something went wrong !");
    }
  }

  // Logout
  void logOut() {
    AuthService().logOut();
  }
}
