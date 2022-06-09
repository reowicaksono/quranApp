import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/app/data/models/Doa.dart';
import 'package:quranapp/app/data/models/jadwalShalat.dart';
import 'dart:convert';
import '../../../data/models/Surah.dart';

class HomeController extends GetxController {

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
 
  Future<List<Doa>> getAllDoa () async{
    Uri url = Uri.parse("https://doa-doa-api-ahmadramadhan.fly.dev/api");
    var response = await http.get(url);
  
    List? data= (json.decode(response.body) as List<dynamic>);
    return data.map((e) => Doa.fromJson(e)).toList();
  }

  Future<Jadwalshalat> getAllJadwalShalat () async{
    Uri uri = Uri.parse("https://api.banghasan.com/sholat/format/json/jadwal/kota/712/tanggal/2020-06-06");
    var response = await http.get(uri);

    Map<String,dynamic> data= (json.decode(response.body) as Map<String,dynamic>)["jadwal"]["data"];
    print(data);
    return Jadwalshalat.fromJson(data);

  }


}
