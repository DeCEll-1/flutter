// ignore_for_file: non_constant_identifier_names

class Ucretlendirme {
  num giris_ucret, saatlik_ucret;
  String otopark_id, id;

  Ucretlendirme({this.giris_ucret = 55, this.id = "-/-/-", this.otopark_id = "-/-", this.saatlik_ucret = 35});

  factory Ucretlendirme.emptyUcretlendirme() {
    return Ucretlendirme();
  }

  factory Ucretlendirme.fromJson(Map<String, dynamic> json) {
    num giris_ucret = json["giris_ucret"];
    String id = json["id"];
    String otopark_id = json["otopark_id"];
    num saatlik_ucret = json["saatlik_ucret"];

    return Ucretlendirme(giris_ucret: giris_ucret, id: id, otopark_id: otopark_id, saatlik_ucret: saatlik_ucret);
  }
}
