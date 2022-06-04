import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/DetailSurah.dart';
import 'package:quranapp/app/data/models/Surah.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String,dynamic>)["data"];

  Surah surahAnnas = Surah.fromJson(data[113]);


  Uri annasUrl = Uri.parse("https://api.quran.sutanlab.id/surah/${surahAnnas.number}");
  var resAnnas = await http.get(annasUrl);

  Map<String,dynamic> dataAnnas = (json.decode(resAnnas.body) as Map<String,dynamic>)["data"];

  DetailSurah detailAnnas = DetailSurah.fromJson(dataAnnas);

  print(detailAnnas.verses![0].text!.arab);
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
