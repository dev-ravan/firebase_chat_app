import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/Res/colors.dart';
import 'package:my_chat_app/Res/texts.dart';
import 'package:my_chat_app/Utils/app_bar.dart';
import 'package:provider/provider.dart';

import '../../Auth/Repo/auth_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, snap, child) => Scaffold(
        appBar: MyAppBar(
          context: context,
          onTap: () {
            snap.logOut();
            Navigator.pop(context);
          },
        ),
        body: buildUserList(),
      ),
    );
  }

  // Build a list of users except login user

  Widget buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong..!"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading.."));
          }

          return ListView(
            children:
                snapshot.data!.docs.map((doc) => usersListTile(doc)).toList(),
          );
        });
  }

  Widget usersListTile(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data["email"]) {
      return Container(
        decoration: BoxDecoration(border: Border.all(color: Palette.grey)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          title: MyTexts().DMSansNormalBlackText(text: data["email"], size: 18),
          onTap: () {},
        ),
      );
    } else {
      return Container();
    }
  }
}
