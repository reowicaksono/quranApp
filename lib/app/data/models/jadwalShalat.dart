// To parse this JSON data, do
//
//     final jadwalshalat = jadwalshalatFromJson(jsonString);

import 'dart:convert';

Jadwalshalat jadwalshalatFromJson(String str) => Jadwalshalat.fromJson(json.decode(str));

String jadwalshalatToJson(Jadwalshalat data) => json.encode(data.toJson());

class Jadwalshalat {
    Jadwalshalat({
        this.status,
        this.data,
    });

    String? status;
    Data? data;

    factory Jadwalshalat.fromJson(Map<String, dynamic> json) => Jadwalshalat(
        status: json["status"],
        data: json["data"] == null ? null :Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.ashar,
        this.dhuha,
        this.dzuhur,
        this.imsak,
        this.isya,
        this.maghrib,
        this.subuh,
        this.tanggal,
        this.terbit,
    });

    String? ashar;
    String? dhuha;
    String? dzuhur;
    String? imsak;
    String? isya;
    String? maghrib;
    String? subuh;
    String? tanggal;
    String? terbit;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ashar: json["ashar"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        imsak: json["imsak"],
        isya: json["isya"],
        maghrib: json["maghrib"],
        subuh: json["subuh"],
        tanggal: json["tanggal"],
        terbit: json["terbit"],
    );

    Map<String, dynamic> toJson() => {
        "ashar": ashar,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "imsak": imsak,
        "isya": isya,
        "maghrib": maghrib,
        "subuh": subuh,
        "tanggal": tanggal,
        "terbit": terbit,
    };
}
