import 'dart:convert';

import 'package:get/get.dart';
import 'package:quranapp/app/data/models/Surah.dart';
import 'package:http/http.dart' as http;

class IntroductionController extends GetxController {
  Future<List<Surah>> getAllSurah () async{
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var response = await http.get(url);
  
    List? dataSurah = (json.decode(response.body) as Map<String,dynamic>)["data"];

    if(dataSurah == null || dataSurah.isEmpty){
      return [];
    }else{
      return dataSurah.map((e) => Surah.fromJson(e)).toList();
    }

  }
}
