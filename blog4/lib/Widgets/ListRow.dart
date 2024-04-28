// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlakaBox extends StatelessWidget {
  final String plaka, ID;
  final int index;
  final Color textColor;
  const PlakaBox({
    super.key,
    required this.plaka,
    required this.ID,
    required this.index,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: textColor, fontSize: 16);
    return Container(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: (index % 2 == 0 ) ? Colors.white : Colors.blue.shade100,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        border: Border.all(color: Colors.black87, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(ID, style: textStyle),
          ),
          Text(plaka, style: textStyle),
        ],
      ),
    );
  }
}
