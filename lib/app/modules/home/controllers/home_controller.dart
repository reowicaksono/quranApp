import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../data/models/Surah.dart';

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah () async{
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var response = await http.get(url);
  
    List? data= (json.decode(response.body) as Map<String,dynamic>)["data"];

    if(data== null || data.isEmpty){
      return [];
    }else{
      return data.map((e) => Surah.fromJson(e)).toList();
    }

  }
}
