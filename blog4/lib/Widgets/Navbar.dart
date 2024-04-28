// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unnecessary_this

import 'package:blog4/Misc/Statics.dart';
import 'package:blog4/Screens/Ekle.dart';
import 'package:flutter/material.dart';
import "package:blog4/main.dart";

class NavBar extends StatelessWidget {
  NavBar({super.key, required this.topPage});

  final MyHomePageState? topPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Cirno"),
            accountEmail: Text("9999999@cirno.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: Image.asset("Assets/Heh.png").image,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(image: Image.asset("Assets/LiveReaction.jpg").image, fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text("Ana Sayfa"),
            onTap: () => topPage?.pageUpdateWithPop("Main"),
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text("Araçları Ekle"),
            onTap: () => topPage?.pageUpdateWithPop("AracEkle"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Araçları Listele"),
            onTap: () => topPage?.pageUpdateWithPop("AracListe"),
            trailing: ClipOval(
              child: Container(
                color: Colors.orange,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    "8",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
