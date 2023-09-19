import 'package:flutter/material.dart';
import 'package:my_chat_app/Res/colors.dart';
import 'package:my_chat_app/Res/texts.dart';

import '../../Feature/Auth/View/auth_gate.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthGate()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      body: Center(
        child: MyTexts().WhiteLogoText(size: 70),
      ),
    );
  }
}
