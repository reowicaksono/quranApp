import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/DetailSurah.dart';
import 'package:quranapp/app/data/models/Surah.dart';
import 'package:quranapp/app/data/models/jadwalShalat.dart';
import 'package:quranapp/app/data/models/namaKota.dart';

void main() async {
  Uri urlKota = Uri.parse("https://api.banghasan.com/sholat/format/json/kota");
  var resKota = await http.get(urlKota);

  var jsonDataKota =
      (json.decode(resKota.body) as Map<String, dynamic>)["kota"];

  Uri namaKota = Uri.parse(
      "https://api.banghasan.com/sholat/format/json/kota");
  var resNamaKota = await http.get(namaKota);

Map<String, dynamic> userdata = json.decode(resNamaKota.body);

  NamaKota namaKota1 = NamaKota.fromJson(userdata);
  var a = namaKota1.kota![0].id;

  // var a = jsonDataNamaKota[0]["id"];

  var b = new DateTime.now()
            .toString()
            .substring(0,10);

  Uri urlJadwalShalat = Uri.parse(
      "https://api.banghasan.com/sholat/format/json/jadwal/kota/$a/tanggal/$b");
  var resJadwalShalat = await http.get(urlJadwalShalat);

  var jsonDataJadwalShalat = (json.decode(resJadwalShalat.body) as Map<String, dynamic>)["jadwal"];
  Jadwalshalat jadwalshalat = Jadwalshalat.fromJson(jsonDataJadwalShalat);

   print(jadwalshalat.data!.ashar);
}

// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:quranapp/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
