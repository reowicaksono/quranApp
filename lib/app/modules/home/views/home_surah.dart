import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/app/modules/home/controllers/home_controller.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../../../data/models/Surah.dart';

class HomeSurah extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FutureBuilder(
            future: controller.getAllSurah(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset("assets/lottie/loading.json"),
                );
              }
              if (!snapshot.hasData) {
                return Text("data not found");
              }

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Surah surah = snapshot.data![index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_PAGE, arguments: surah);
                      },
                      title: Text("${surah.name!.transliteration!.id}"),
                      subtitle: Text(
                          "${surah.numberOfVerses} Surat dari ${surah.revelation!.id}"),
                      leading: CircleAvatar(child: Text("${surah.number}")),
                      trailing: Text("${surah.name!.short}"),
                    );
                  });
            },
          ),
        ),
      );
  }
}