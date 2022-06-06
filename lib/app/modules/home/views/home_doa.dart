import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/app/data/models/Doa.dart';
import 'package:quranapp/app/modules/home/controllers/home_controller.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../../../data/models/Surah.dart';

class HomeDoa extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FutureBuilder(
            future: controller.getAllDoa(),
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
                    Doa doa = snapshot.data![index];
                    return ListTile(
                      title: Text("${doa.doa}"),
                      subtitle: Text(
                          "${doa.ayat} "),
                      leading: CircleAvatar(child: Text("${doa.id}")),
                      
                    );
                  });
            },
          ),
        ),
      );
  }
}