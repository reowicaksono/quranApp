import 'dart:convert';

import 'package:get/get.dart';
import 'package:quranapp/app/data/models/DetailSurah.dart';
import 'package:http/http.dart' as http;

class DetailPageController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/$id");
    var response = await http.get(url);

    Map<String, dynamic> data = (json.decode(response.body) as Map<String, dynamic>)["data"];

 
    return DetailSurah.fromJson(data);
  }
}
