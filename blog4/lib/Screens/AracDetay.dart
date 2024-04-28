// ignore_for_file: no_logic_in_create_state, unnecessary_null_comparison, prefer_const_constructors

import 'dart:async';

import 'package:blog4/Services/DataAccessLayer.dart';
import 'package:blog4/Services/Models/AracModel.dart';
import 'package:blog4/Services/Models/UcretlendirmeModel.dart';
import 'package:flutter/material.dart';

class AracDetay extends StatefulWidget {
  AracDetay({super.key, this.arac, required String title});
  Arac? arac;

  _AracDetayState? state;

  @override
  State<AracDetay> createState() {
    _AracDetayState state = _AracDetayState(arac: (arac == null) ? Arac.emptyArac() : arac as Arac);

    this.state = state;

    return state;
  }
}

class _AracDetayState extends State<AracDetay> {
  _AracDetayState({required this.arac});
  Arac arac;

  BoxDecoration decoration =
      BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.black)), borderRadius: BorderRadius.circular(3), color: Colors.transparent);

  TextStyle textStyle = TextStyle(fontSize: 20, backgroundColor: Colors.transparent);

  Ucretlendirme? ucretlendirme;

  @override
  void initState() {
    super.initState();

    DataAccessLayer().getUcretlendirme("EPOV0oo89MyVMM2JdIIk").then((ucretlendirme) {
      this.ucretlendirme = ucretlendirme;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (arac == null) {
      return Container(child: Text("ERROR"));
    }

    DateTime suan = DateTime.now();
    DateTime giris = DateTime.parse(arac.tarih.toString());
    int saat = suan.difference(giris).inHours;
    String saatmesaj = "${saat.toString()} saat oldu";
    String tarihStr =
        "${arac.tarih.day.toString()}/${arac.tarih.month.toString()}/${arac.tarih.year.toString()} ${arac.tarih.hour.toString()}:${arac.tarih.minute.toString()}";

    // print(DataAccessLayer().getUcretlendirme("EPOV0oo89MyVMM2JdIIk")?.id);

    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: decoration,
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              child: Text(arac.plaka, style: textStyle),
            ),
            Container(
              decoration: decoration,
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              child: Text(arac.tarih.toString(), style: textStyle),
            ),
            Container(
              decoration: decoration,
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              child: Text(tarihStr, style: textStyle),
            ),
            Container(
              decoration: decoration,
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              child: Text((ucretlendirme == null) ? "" : ucretlendirme!.id, style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
