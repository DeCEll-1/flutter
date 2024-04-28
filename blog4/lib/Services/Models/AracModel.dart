class Arac {
  final String plaka, id;
  DateTime tarih = DateTime.now();

  Arac({this.id = "", required this.plaka, tarih}) {
    if (tarih != null) {
      this.tarih = tarih;
    }
  }
  factory Arac.emptyArac() {
    return Arac(plaka: "", id: "", tarih: null);
  }

  factory Arac.fromJson(Map<String, dynamic> json) {
    String id = json["id"];
    String plaka = json["plaka"];

    return Arac(id: id, plaka: plaka);
  }
}
