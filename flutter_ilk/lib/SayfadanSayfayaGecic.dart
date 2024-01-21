// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';

class SayfadanSayfaya extends StatelessWidget {
  const SayfadanSayfaya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => GirisEkrani(),
        "/ProfilSayfasi": (context) => ProfilEkrani(),
      },
      title: "Sayfalar",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController kullaniciTED = TextEditingController();
  TextEditingController sifreTED = TextEditingController();

  void GirisYap() {
    Navigator.pushNamed(context, "/ProfilSayfasi",
        arguments:
            DataModel(kullaniciAdi: kullaniciTED.text, sifre: sifreTED.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            //
            Image(
              image: AssetImage("assets/4707071.jpg"),
              width: 200,
            ),
            //
            SizedBox(
              height: 20,
            ),
            //
            TextFormField(
              controller: kullaniciTED,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 2)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  hintText: "Kullanıcı Adı Yazınız"),
            ),
            //
            SizedBox(height: 20),
            //
            TextFormField(
              controller: sifreTED,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                hintText: "Şifre Yazınız",
              ),
            ),
            //
            SizedBox(height: 20),
            //
            ElevatedButton(
              onPressed: GirisYap,
              //
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // color:Colors.white
                  )),

              child: Text("Giriş Yap"),
              //
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({super.key});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  void CikisYap() {
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    DataModel gelenVeri =
        ModalRoute.of(context)?.settings.arguments as DataModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Ekranı"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: CikisYap, child: Text("Çıkış")),
            Text(gelenVeri.kullaniciAdi),
            Text(gelenVeri.sifre),
          ],
        ),
      ),
    );
  }
}

class DataModel {
  String kullaniciAdi, sifre;

  DataModel({required this.kullaniciAdi, required this.sifre});
}
