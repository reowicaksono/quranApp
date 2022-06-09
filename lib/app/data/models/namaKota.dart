// To parse this JSON data, do
//
//     final namaKota = namaKotaFromJson(jsonString);

import 'dart:convert';

NamaKota namaKotaFromJson(String str) => NamaKota.fromJson(json.decode(str));

String namaKotaToJson(NamaKota data) => json.encode(data.toJson());

class NamaKota {
    NamaKota({
        this.status,
        this.query,
        this.kota,
    });

    String? status;
    Query? query;
    List<Kota>? kota;

    factory NamaKota.fromJson(Map<String, dynamic> json) => NamaKota(
        status: json["status"],
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
        kota: json["kota"] == null ? null : List<Kota>.from(json["kota"].map((x) => Kota.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "query": query!.toJson(),
        "kota": List<dynamic>.from(kota!.map((x) => x.toJson())),
    };
}

class Kota {
    Kota({
        this.id,
        this.nama,
    });

    String? id;
    String? nama;

    factory Kota.fromJson(Map<String, dynamic> json) => Kota(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
    };
}

class Query {
    Query({
        this.format,
    });

    String? format;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        format: json["format"],
    );

    Map<String, dynamic> toJson() => {
        "format": format,
    };
}
