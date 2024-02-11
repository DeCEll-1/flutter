// ignore_for_file: prefer_const_constructors, unnecessary_new, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const Blog());
}

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Iskelet(title: 'Title'),
    );
  }
}

class Iskelet extends StatefulWidget {
  const Iskelet({super.key, required this.title});

  final String title;

  @override
  State<Iskelet> createState() => _IskeletState();
}

class _IskeletState extends State<Iskelet> {
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  KategoriEkle() async {
    await FirebaseFirestore.instance
        .collection("Kategoriler")
        .doc(t1.text)
        .set({"Isim": t1.text, "Aciklama": t2.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            TextField(
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            ElevatedButton(
                onPressed: KategoriEkle, child: Text("Kategori Ekle"))
          ],
        )),
      ),
    );
  }
}
