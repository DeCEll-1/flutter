// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, unused_import, sort_child_properties_last, must_be_immutable, unused_local_variable

import 'dart:async';
import 'dart:collection';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:blog4/Misc/Statics.dart';
import 'package:blog4/Screens/AracDetay.dart';
import 'package:blog4/Screens/Ekle.dart';
import 'package:blog4/Screens/ListPage.dart';
import 'package:blog4/Screens/MainMenu.dart';
import 'package:blog4/Services/Models/AracModel.dart';
import 'package:blog4/Widgets/Navbar.dart';
import 'package:blog4/Options/firebase_options.dart';
import 'package:blog4/Widgets/rainbow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradients/gradients.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static String currPage = "Main";
  static Map<String, Widget> pages = <String, Widget>{
    "Main": MainMenu(),
    "AracEkle": AracEkle(title: "Araç Ekle"),
    "AracListe": ListPage(title: "Araç Listele"),
    "AracDetay": AracDetay(title: "Araç Detayları", arac: Arac.emptyArac()),
  };

  int _currIndex = 1;

  pageUpdateWithPop(String page) {
    pageUpdate(page);
    Navigator.pop(context);
  }

  pageUpdate(String page) {
    setState(() {
      currPage = page;
    });
  }

  pageUpdateAracDetay(Arac arac) {
    pages.update(
      "AracDetay",
      (value) => AracDetay(
        title: "Araç Detayları",
        arac: arac,
      ),
    );
    pageUpdate("AracDetay");
  }

  @override
  Widget build(BuildContext context) {
    Statics.topPage = this;

    return Scaffold(
      drawer: NavBar(topPage: this),
      appBar: AppBar(
        title: Container(
          child: Text(
            "Title",
            style: GoogleFonts.orbitron(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 2))),
        child: pages[currPage],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        activeIndex: _currIndex,
        tabBuilder: (int index, bool isActive) {
          return Center(
            child: returnBottomBar(index, isActive),
          );
        },
        itemCount: 3,
        gapLocation: GapLocation.none,
        onTap: (index) {
          switch (index) {
            case 0:
              pageUpdate("AracEkle");
              break;
            case 1:
              pageUpdate("Main");
              break;
            case 2:
              pageUpdate("AracListe");
              break;
            default:
          }
          _currIndex = index;
        },
      ),
    );
  }

  // #region

  returnBottomBar(int index, bool isActive) {
    double borderRadius = 7;
    Color textBackgroundColor = Colors.white;
    Color cardColor = Colors.cyan.shade200;
    Color textColor = Colors.black;
    double textPadding = 4;
    double cardPadding = 6;
    double elevation = 7;

    cardColor = isActive ? Colors.cyan.shade400 : Colors.cyan.shade200;

    switch (index) {
      case 0:
        return getButton(
            text: "Araç Ekle",
            borderRadius: borderRadius,
            textBackgroundColor: textBackgroundColor,
            cardColor: cardColor,
            textColor: textColor,
            textPadding: textPadding,
            cardPadding: cardPadding,
            elevation: elevation);
      case 1:
        return getButton(
            text: "Ana Menu",
            borderRadius: borderRadius,
            textBackgroundColor: textBackgroundColor,
            cardColor: cardColor,
            textColor: textColor,
            textPadding: textPadding,
            cardPadding: cardPadding,
            elevation: elevation);
      case 2:
        return getButton(
            text: "Araç Listele",
            borderRadius: borderRadius,
            textBackgroundColor: textBackgroundColor,
            cardColor: cardColor,
            textColor: textColor,
            textPadding: textPadding,
            cardPadding: cardPadding,
            elevation: elevation);
      default:
    }
    return [Text("AAAAAAAAA")];
  }

  List<ColorBounce> gradientList = [
    ColorBounce(126, 0, 255),
    ColorBounce(255, 126, 0),
  ];

  getButton(
      {required String text,
      required double borderRadius,
      required Color textBackgroundColor,
      required Color cardColor,
      required Color textColor,
      required double textPadding,
      required double cardPadding,
      required double elevation}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black54,
            width: 3,
          ),
        ),
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: RainbowWidget(
          child: Container(
            padding: EdgeInsets.all(cardPadding),
            child: Container(
              padding: EdgeInsets.all(textPadding),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                color: textBackgroundColor,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
          ),
          gradientStartList: gradientList,
          advanceAmount: 1,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
      ),
    );
  }

  // #endregion
}
