import 'package:flutter/material.dart';
import 'package:my_chat_app/Feature/Auth/View/sign_up.dart';
import 'package:my_chat_app/Res/buttons.dart';
import 'package:my_chat_app/Res/colors.dart';
import 'package:my_chat_app/Res/text_fields.dart';
import 'package:my_chat_app/Res/texts.dart';
import 'package:provider/provider.dart';
import '../../../Res/sizes.dart';
import '../Controller/login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.white,
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) => Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Logo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Align(
                      alignment: Alignment.center,
                      child: MyTexts().LogoText(size: 70)),
                ),
                // Login Text
                MyTexts().TitleText(text: "Login"),
                gap5,
                MyTexts().MiniText(text: "Please login to continue app"),
                gap30,

                // Email Field
                Form(
                  key: loginProvider.formKey,
                  child: Column(
                    children: [
                      MyTextFields().authField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          icon: Icons.mail,
                          controller: loginProvider.emailController,
                          hintText: "Email address"),
                      gap20,

                      // Password Field
                      MyTextFields().authField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter valid password";
                            } else if (value.length <= 6) {
                              return "Password should at least 6 digits";
                            }
                            return null;
                          },
                          obscure: true,
                          icon: Icons.key,
                          controller: loginProvider.passwordController,
                          hintText: "Password"),
                    ],
                  ),
                ),
                gap20,
                // Login Button
                MyButtons().customButton(
                    context: context,
                    title: "L o g i n",
                    onTap: () {
                      if (loginProvider.formKey.currentState!.validate()) {
                        loginProvider.logIn(context: context);
                        print("login");
                      }
                    }),
                gap20,
                Row(
                  children: [
                    MyTexts().MiniText(text: "Don't have an account?"),
                    gap5,
                    MyButtons().redButton(
                        title: "Register",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
