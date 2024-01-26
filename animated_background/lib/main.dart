// ignore_for_file: prefer_const_constructors

import 'package:animated_background/rainbow.dart';
import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ColorBounce> colorsBounceable = <ColorBounce>[
    ColorBounce(255, 0, 126),
    ColorBounce(0, 126, 255),
  ];

  List<Color> colors = List.empty();

  void UpdateColors() {
    List<Color> bufferColorList = List.empty(growable: true);

    colorsBounceable.forEach((color) {

      color.advance();

      bufferColorList.add(color.GetColor());      

    });

    colors = bufferColorList;
  }

  void MySetState() {
    setState(() {
      UpdateColors();
    });
  }

  @override
  initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 10), (args) {
      MySetState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradientPainter(colors: colors),
        ),
      ),
    );
  }
}
