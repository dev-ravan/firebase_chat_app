import 'package:flutter/material.dart';
import 'package:my_chat_app/Feature/Auth/View/login.dart';
import 'package:provider/provider.dart';

import '../../../Utils/snack_bar.dart';
import '../Repo/auth_service.dart';

class SignUpProvider extends ChangeNotifier {
  // Global form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Sign Up
  void signUp({required BuildContext context}) {
    try {
      final authProvider = Provider.of<AuthService>(context, listen: false);
      authProvider
          .signUpWithEmailAndPassword(
              email: emailController.text, password: newPasswordController.text)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()))
              });
    } catch (e) {
      SnackBars.showSnackBar(
          context: context, message: "Something went wrong !");
    }
  }
}
