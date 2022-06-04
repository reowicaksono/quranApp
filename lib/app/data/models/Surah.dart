// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
    Surah({
        this.number,
        this.sequence,
        this.numberOfVerses,
        this.name,
        this.revelation,
        this.tafsir,
    });

    int? number;
    int? sequence;
    int? numberOfVerses;
    Name? name;
    Revelation? revelation;
    Tafsir? tafsir;

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
    };
}

class Name {
    Name({
        this.short,
        this.long,
        this.transliteration,
        this.translation,
    });

    String? short;
    String? long;
    Translation? transliteration;
    Translation? translation;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
    );

    Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
    };
}

class Translation {
    Translation({
        this.en,
        this.id,
    });

    String? en;
    String? id;

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
    };
}

class Revelation {
    Revelation({
        this.arab,
        this.en,
        this.id,
    });

    String? arab;
    String? en;
    String? id;

    factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
    };
}

class Tafsir {
    Tafsir({
        this.id,
    });

    String? id;

    factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
