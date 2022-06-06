// To parse this JSON data, do
//
//     final doa = doaFromJson(jsonString);

import 'dart:convert';

Doa doaFromJson(String str) => Doa.fromJson(json.decode(str));

String doaToJson(Doa data) => json.encode(data.toJson());

class Doa {
    Doa({
        this.id,
        this.doa,
        this.ayat,
        this.latin,
        this.artinya,
    });

    String? id;
    String? doa;
    String? ayat;
    String? latin;
    String? artinya;

    factory Doa.fromJson(Map<String, dynamic> json) => Doa(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
    };
}
