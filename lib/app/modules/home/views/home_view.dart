import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranapp/app/data/models/Surah.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FutureBuilder(
            future: controller.getAllSurah(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Text("data not found");
              }
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Surah surah = snapshot.data![index];
                return ListTile(
                  title: Text("${surah.name!.translation!.id}"), 
                  subtitle: Text("${surah.numberOfVerses} Surat dari ${surah.revelation!.id}"),
                  leading: CircleAvatar(child: Text("${surah.number}")),
                  trailing: Text("${surah.name!.short}"),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
