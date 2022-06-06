import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/app/data/models/DetailSurah.dart' as ds;
import 'package:quranapp/app/data/models/Surah.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  @override
  Widget build(BuildContext context) {
    Surah surah = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${surah.name!.transliteration!.id}'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "${surah.name!.transliteration!.id}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "( ${surah.name!.translation!.id} )",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${surah.numberOfVerses} ayat || ${surah.revelation!.id}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<ds.DetailSurah>(
                future: controller.getDetailSurah(surah.number.toString()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Lottie.asset("assets/lottie/loading.json"),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Text("data not found");
                  }
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.verses!.length,
                        itemBuilder: (context, index) {
                          ds.Verse ayat = snapshot.data!.verses![index];
                          return Column(
                            children: [
                              Card(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    child: Text("${index + 1}"),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.bookmark_add_outlined)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_arrow)),
                                    ],
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(204, 132, 171, 226),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Text(
                                      "${ayat.text!.arab}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${ayat.text!.transliteration!.en}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "(${ayat.translation!.id})",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start,
                                
                              ),
                            ],
                          );
                        }),
                  );
                })
          ],
        ),
      )),
    );
  }
}
