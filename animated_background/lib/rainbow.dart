// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

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
