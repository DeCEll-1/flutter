// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_logic_in_create_state

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';

class ColorBounce {
  int r;
  int g;
  int b;

  bool rAccending = true;
  bool gAccending = true;
  bool bAccending = true;

  ColorBounce(this.r, this.g, this.b);

  void advance({int repeatAmount = 1}) {
    //int amount = 1;
    for (var i = 0; i < repeatAmount; i++) {
      int colorValueBuffer = 0;
      bool accendingBuffer = true;

      (colorValueBuffer, accendingBuffer) = ValueBounce(r, rAccending);
      r = colorValueBuffer;
      rAccending = accendingBuffer;

      (colorValueBuffer, accendingBuffer) = ValueBounce(g, gAccending);
      g = colorValueBuffer;
      gAccending = accendingBuffer;

      (colorValueBuffer, accendingBuffer) = ValueBounce(b, bAccending);
      b = colorValueBuffer;
      bAccending = accendingBuffer;
    }
  }

  (int, bool) ValueBounce(int value, bool accending) {
    int amount = 1;
    if (value == 255 && accending) {
      value -= amount;
      accending = false;
    } else if (value == 0 && !accending) {
      value += amount;
      accending = true;
    } else if (accending) {
      value += amount;
    } else {
      value -= amount;
    }
    return (value, accending);
  }

  Color GetColor({int alpha = 255}) {
    return RgbColor(r, g, b, alpha);
  }
}

class RainbowWidget extends StatefulWidget {
  RainbowWidget({
    super.key,
    required this.gradientStartList,
    required this.child,
    this.decoration = const BoxDecoration(),
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.advanceAmount,
  });
  List<ColorBounce> gradientStartList = List.empty();
  Widget child = Container(child: Text("ERROR"));
  Alignment begin;
  Alignment end;
  BoxDecoration decoration;
  double advanceAmount = 1;

  @override
  State<RainbowWidget> createState() =>
      _RainbowWidgetState(gradientStartList: gradientStartList, child: child, decoration: decoration, begin: begin, end: end, advanceAmount: advanceAmount);
}

class _RainbowWidgetState extends State<RainbowWidget> with SingleTickerProviderStateMixin {
  _RainbowWidgetState({
    required this.gradientStartList,
    required this.child,
    required this.decoration,
    required this.begin,
    required this.end,
    required this.advanceAmount,
  });

  //#region trash
  Widget child = Container(child: Text("ERROR"));

  List<Color> colors = List.empty(growable: true);
  List<ColorBounce> gradientStartList = List.from(<ColorBounce>[ColorBounce(255, 255, 255), ColorBounce(0, 0, 0)]);

  Alignment begin = Alignment.centerLeft;
  Alignment end = Alignment.centerRight;
  BoxDecoration decoration = BoxDecoration();

  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;

  double advanceAmount = 1;

  Interval interval = Interval(0, 1);
  //#endregion

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1));

    UpdateColors();

    // Rebuilding the screen when animation goes ahead
    double s = 0;
    controller!.addListener(() {
      setState(() {
        if (interval.transform(s) == 0) {
          UpdateColors();
        }
        s += advanceAmount;
        if (s >= 1) s = 0;
      });
    });

    controller!.repeat(period: Duration(seconds: 1));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void UpdateColors() {
    List<Color> bufferColorList = List.empty(growable: true);

    gradientStartList.forEach((color) {
      color.advance();

      bufferColorList.add(color.GetColor());
    });

    colors = bufferColorList;
  }

  @override
  Widget build(BuildContext context) {
    this.decoration = BoxDecoration(
      backgroundBlendMode: decoration.backgroundBlendMode,
      border: decoration.border,
      borderRadius: decoration.borderRadius,
      boxShadow: decoration.boxShadow,
      color: decoration.color,
      image: decoration.image,
      shape: decoration.shape,
      gradient: LinearGradientPainter(colors: colors, begin: begin, end: end),
    );

    return Container(
      decoration: decoration,
      child: child,
    );
  }
}
