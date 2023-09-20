import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Res/buttons.dart';
import '../../../Res/colors.dart';
import '../../../Res/sizes.dart';
import '../../../Res/text_fields.dart';
import '../../../Res/texts.dart';
import '../Controller/sign_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Consumer<SignUpProvider>(
        builder: (context, signUpProvider, child) => Padding(
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
                MyTexts().TitleText(text: "Sign Up"),
                gap5,
                MyTexts().DMSansNormalBlackText(
                    size: 15, text: "Require information for account creation"),
                gap30,

                Form(
                    key: signUpProvider.formKey,
                    child: Column(
                      children: [
                        // Email Field
                        MyTextFields().authField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                            icon: Icons.mail,
                            controller: signUpProvider.emailController,
                            hintText: "Email address"),
                        gap20,

                        // New Password Field
                        MyTextFields().authField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter valid password";
                              } else if (value.length < 6) {
                                return "Password should at least 6 digits";
                              }
                              return null;
                            },
                            obscure: true,
                            icon: Icons.key,
                            controller: signUpProvider.newPasswordController,
                            hintText: "New Password"),
                        gap20,
                        // Confirm Password Field
                        MyTextFields().authField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter valid password";
                              } else if (value.length < 6) {
                                return "Password should at least 6 digits";
                              }
                              return null;
                            },
                            obscure: true,
                            icon: Icons.key,
                            controller:
                                signUpProvider.confirmPasswordController,
                            hintText: "Repeat Password"),
                      ],
                    )),
                gap20,
                // Login Button
                MyButtons().customButton(
                    context: context,
                    title: "S i g n  U p",
                    onTap: () {
                      if (signUpProvider.formKey.currentState!.validate()) {
                        // once given the right credentials navigate to the login page
                        signUpProvider.signUp(context: context);
                      }
                    }),
                gap20,

                Row(
                  children: [
                    MyTexts().DMSansNormalBlackText(
                        text: "Already you have an account?", size: 15),
                    gap5,
                    MyButtons().redButton(
                        title: "Login",
                        onTap: () {
                          Navigator.pop(context);
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
