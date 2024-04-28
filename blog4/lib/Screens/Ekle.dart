// ignore_for_file: prefer_const_constructors

import 'package:blog4/Services/DataAccessLayer.dart';
import 'package:blog4/Services/Models/AracModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AracEkle extends StatefulWidget {
  const AracEkle({super.key, required this.title});

  final String title;

  @override
  State<AracEkle> createState() => _AracEkleState();
}

class _AracEkleState extends State<AracEkle> {
  TextEditingController t1 = new TextEditingController(text: "");

  aracEkle() {
    DataAccessLayer().aracEkle(Arac(plaka: t1.text));
    t1.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        controller: t1,
                        decoration: InputDecoration(
                          label: Text("Plaka"),
                          hintText: 'Plaka Yazınız',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan.shade400),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade300),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: aracEkle,
                        child: Text("Araç Ekle"),
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.fromLTRB(120, 10, 120, 10)),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
