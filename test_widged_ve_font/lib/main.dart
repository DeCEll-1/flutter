// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_widged_ve_font/Statics/mainColors.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors().Lime),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mob Dev Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularText(
                children: [
                  TextItem(
                      text: Text(
                        'The Normal Album',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Antiqua",
                            letterSpacing: 5,
                            // color: const Color.fromARGB(255, 0, 114, 129),
                            color: MyColors().Green),
                      ),
                      space: 15,
                      startAngle: -90,
                      startAngleAlignment: StartAngleAlignment.center,
                      direction: CircularTextDirection.clockwise),
                ],
                radius: 125,
                position: CircularTextPosition.inside,
                backgroundPaint: Paint()..color = MyColors().Lime,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  Container returnCircle(double radius, double maxRadius) {
    maxRadius *= 2;
    radius *= 2;

    return Container(
        child: Column(
      children: [
        SizedBox(
          height: maxRadius - radius,
        ),
        CircularText(
          children: [
            TextItem(
                text: Text(
                  '/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Antiqua",
                      letterSpacing: -5,
                      // color: const Color.fromARGB(255, 0, 114, 129),
                      color: MyColors().Green),
                ),
                space: 3,
                startAngle: -90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise)
          ],
          radius: radius,
          position: CircularTextPosition.inside,
          backgroundPaint: Paint()..color = MyColors().Lime,
        ),
      ],
    ));
  }
}
