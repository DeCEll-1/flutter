import 'package:flutter/material.dart';


class HesapMakinesi extends StatelessWidget {
  const HesapMakinesi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.dark().copyWith(primary: Colors.black)),
      title: "Ilkel Hesap Makines",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hesap Makinesi")), body: AnaEkran());
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  num sayi1 = 0, sayi2 = 0, _sonuc = 0;

  TextEditingController textFieldEditor1 = TextEditingController(text: '0');
  TextEditingController textFieldEditor2 = TextEditingController(text: '0');

  SayiTopla() {
    setState(() {
      if (textFieldEditor1.text != "") sayi1 = num.parse(textFieldEditor1.text);
      if (textFieldEditor1.text != "") sayi2 = num.parse(textFieldEditor2.text);
      _sonuc = sayi1 + sayi2;
    });
  }

  SayiCikar() {
    setState(() {
      if (textFieldEditor1.text != "") sayi1 = num.parse(textFieldEditor1.text);
      if (textFieldEditor1.text != "") sayi2 = num.parse(textFieldEditor2.text);
      _sonuc = sayi1 - sayi2;
    });
  }

  SayiCarp() {
    setState(() {
      if (textFieldEditor1.text != "") sayi1 = num.parse(textFieldEditor1.text);
      if (textFieldEditor1.text != "") sayi2 = num.parse(textFieldEditor2.text);
      _sonuc = sayi1 * sayi2;
    });
  }

  SayiBol() {
    setState(() {
      if (textFieldEditor1.text != "") sayi1 = num.parse(textFieldEditor1.text);
      if (textFieldEditor1.text != "") sayi2 = num.parse(textFieldEditor2.text);
      _sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Center(
          child: Column(
        children: <Widget>[
          Text(_sonuc.toString()),
          TextField(
            controller: textFieldEditor1,
          ),
          TextField(
            controller: textFieldEditor2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: SayiTopla, child: Text("+")),
              ElevatedButton(onPressed: SayiCikar, child: Text("-")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: SayiCarp, child: Text("*")),
              ElevatedButton(onPressed: SayiBol, child: Text("/"))
            ],
          )
        ],
      )),
    );
  }
}
