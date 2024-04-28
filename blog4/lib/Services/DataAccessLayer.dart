// ignore_for_file: dead_code

import 'package:blog4/Services/Models/AracModel.dart';
import 'package:blog4/Services/Models/UcretlendirmeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DataAccessLayer {
  final araclarCol = FirebaseFirestore.instance.collection('araclar');
  final ucretlendirmelerCol = FirebaseFirestore.instance.collection('ucretlendirmeler');

  void aracEkle(Arac arac) {
    araclarCol.doc(arac.plaka).set({
      "id": Uuid().v1().toString(),
      "plaka": arac.plaka,
      "tarih": DateTime.now(),
    });
  }

  Future<List<Arac>> getAraclar() async {
    Iterable<Map<String, dynamic>> aracDocs;

    var snapshot = await araclarCol.get();

    aracDocs = snapshot.docs.map((e) => e.data());

    List<Arac> aracList = [];

    for (Map<String, dynamic> json in aracDocs) {
      aracList.add(Arac.fromJson(json));
    }

    return aracList;
  }

  // Future<Ucretlendirme> getUcretlendirme(String id) {
  //   Ucretlendirme ucretlendirme = Ucretlendirme.emptyUcretlendirme();

  //   _getUcretlendirme(id).then((value) {
  //     ucretlendirme = value;
  //   });

  //   return ucretlendirme
  // }

  Future<Ucretlendirme> getUcretlendirme(String id) async {
    final Map<String, dynamic>? ucretlendirmeDoc = await ucretlendirmelerCol.doc(id).get().then((value) => value.data());

    final ucretlendirmeModel = Ucretlendirme.fromJson(ucretlendirmeDoc as Map<String, dynamic>);
    return ucretlendirmeModel;
  }
}
