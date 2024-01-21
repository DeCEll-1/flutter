// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        // body: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     color: Colors.amber,
        //     width: 100,
        //     height: 100,
        //   ),
        // ),

        // body: Center(
        //   child: Container(
        //     color: Colors.amber,
        //     width: 200,
        //     height: 200,
        //     child: Container(
        //       color: Colors.purple,
        //     ),
        //   ),
        // ),


        body:



      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
